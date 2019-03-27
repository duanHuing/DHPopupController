//
//  DHPopupController.m
//  DHTest
//
//  Created by bangju on 2019/2/25.
//  Copyright © 2019年 duan. All rights reserved.
//

#define svWidth   CGRectGetWidth(self.view.bounds)
#define svHeight  CGRectGetHeight(self.view.bounds)
#define cWidth    CGRectGetWidth(self.contentView.bounds)
#define cHeight   CGRectGetHeight(self.contentView.bounds)

#import "DHPopupController.h"

@interface DHPopupController ()

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) UIView *contentView;

@end

@implementation DHPopupController

- (void)dealloc {
    NSLog(@"%@ -- dealloc",[self class]);
}

- (instancetype)init {
    if (self = [super init]) {
        [self dh_initial];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    [self.view addSubview:self.maskView];
    
}

- (void)dh_initial {
    self.maskViewInsets = UIEdgeInsetsZero;
    self.isDismissOnTouthMask = YES;
    self.style = DHPopupControllerStyleCenter;
    self.contentViewCornerRadius = 5;
    self.duration = 0.25;
}

// 初始布局
- (void)setupInitialLayout {
    
    switch (self.style) {
        case DHPopupControllerStyleTop: {
            self.contentView.frame = CGRectMake((svWidth - cWidth) / 2, -cHeight, cWidth, cHeight);
            break;
        }
        case DHPopupControllerStyleLeft: {
            self.contentView.frame = CGRectMake(-cWidth, (svHeight - cHeight) / 2, cWidth, cHeight);
            break;
        }
        case DHPopupControllerStyleBottom: {
            self.contentView.frame = CGRectMake((svWidth - cWidth) / 2, CGRectGetHeight(self.view.bounds), cWidth, cHeight);
            break;
        }
            
        case DHPopupControllerStyleRight: {
            self.contentView.frame = CGRectMake(svWidth + cWidth, (svHeight - cHeight) / 2, cWidth, cHeight);
            break;
        }
            
        case DHPopupControllerStyleCenter: {
            self.contentView.center = CGPointMake(svWidth / 2, svHeight / 2);
            break;
        }
        case DHPopupControllerStyleCustom: {
            
        };
    }
    
    [self setup_corner];
}

// 设置圆角
- (void)setup_corner {
    
    if (self.contentViewCornerRadius == 0) {
        return;
    }
    UIRectCorner rectCorner = UIRectCornerAllCorners;
    BOOL isCorner = NO;
    if (_style == DHPopupControllerStyleBottom) {
        rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight ;
        isCorner = YES;
    }
    else if (_style == DHPopupControllerStyleCustom ||
             _style == DHPopupControllerStyleCenter) {
        isCorner = YES;
    }
    
    if (isCorner) {
        //贝塞尔曲线 切左上和右上的圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(self.contentViewCornerRadius, self.contentViewCornerRadius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _contentView.bounds;
        maskLayer.path = maskPath.CGPath;
        _contentView.layer.mask = maskLayer;
    }
}

//视图显示完 弹出弹窗
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //执行动画
    [UIView animateWithDuration:self.duration animations:^{
        CGRect frame = self.contentView.frame;
        switch (self.style) {
            case DHPopupControllerStyleTop: {
                frame.origin.y = 0;
                break;
            }
            case DHPopupControllerStyleLeft: {
                frame.origin.x = 0;
                break;
            }
            case DHPopupControllerStyleBottom: {
                frame.origin.y = svHeight - cHeight;
                break;
            }
            case DHPopupControllerStyleRight: {
                frame.origin.x = svWidth - cWidth;
                break;
            }
            case DHPopupControllerStyleCenter: {
                self.contentView.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2);
                break;
            }
            case DHPopupControllerStyleCustom: ;
        }
        self.contentView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark -- actions
//显示弹出框
- (void)showPopupView:(UIView*)popupView fromController:(UIViewController*)vc {
    
    if (popupView) {
        self.contentView = popupView;
        [self.view addSubview:popupView];
        [self setupInitialLayout];
    }
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [vc presentViewController:self animated:NO completion:nil];
}

//点击背景处，收起弹框
- (void)clickedMaskViewWithTap:(UITapGestureRecognizer*)tap {
    
    if (self.isDismissOnTouthMask) {
        [self dismiss];
    }
    
    [self.view endEditing:YES];
}

// 返回
- (void)dismiss {
    [UIView animateWithDuration:self.duration animations:^{
        
        [self setupInitialLayout];
        
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

#pragma mark - super

// 屏幕旋转时，会被调用
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    CGRect rect = self.maskView.frame;
    rect.size = size;
    self.maskView.frame = rect;
    
    CGRect rect2 = self.contentView.frame;
    switch (self.style) {
        case DHPopupControllerStyleTop: {
            rect2.origin.x = (size.width - CGRectGetWidth(rect2)) / 2;
            rect2.origin.y = 0;
        }break;
            
        case DHPopupControllerStyleLeft: {
            rect2.origin.x = 0;
            rect2.origin.y = (size.height - CGRectGetHeight(rect2)) / 2;
        }break;
            
        case DHPopupControllerStyleBottom: {
            rect2.origin.x = (size.width - CGRectGetWidth(rect2)) / 2;
            rect2.origin.y = size.height - CGRectGetHeight(rect2);
        }break;
        
        case DHPopupControllerStyleRight: {
            rect2.origin.x = size.width - CGRectGetWidth(rect2);
            rect2.origin.y = (size.height - CGRectGetHeight(rect2)) / 2;
        }break;
            
        case DHPopupControllerStyleCenter: {
            rect2.origin.x = (size.width - CGRectGetWidth(rect2)) / 2;
            rect2.origin.y = (size.height - CGRectGetHeight(rect2)) / 2;
        }break;
            
        case DHPopupControllerStyleCustom: {
            
        }break;
    }
    
    self.contentView.frame = rect2;
}

#pragma mark -- setter

- (void)setIsDismissOnTouthMask:(BOOL)isDismissOnTouthMask {
    _isDismissOnTouthMask = isDismissOnTouthMask;
    
    //self.maskView.userInteractionEnabled = _isDismissOnTouthMask;
}

/** maskView 与屏幕的间隔 */
- (void)setMaskViewInsets:(UIEdgeInsets)maskViewInsets {
    _maskViewInsets = maskViewInsets;
    
    self.maskView.frame = CGRectMake(maskViewInsets.left, maskViewInsets.top, CGRectGetWidth(self.view.bounds) - maskViewInsets.left - maskViewInsets.right, CGRectGetHeight(self.view.bounds) - maskViewInsets.top - maskViewInsets.bottom);
}

#pragma mark -- getter

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedMaskViewWithTap:)];
        _maskView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        _maskView.userInteractionEnabled = YES;
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}

@end

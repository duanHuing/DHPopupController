//
//  DHAlertView.m
//  PopupDemo
//
//  Created by bangju on 2019/2/28.
//  Copyright © 2019年 duan. All rights reserved.
//

#import "DHAlertView.h"

@interface DHAlertView ()

@property (nonatomic, strong) UILabel  *titleLab;

@end

@implementation DHAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.text = @"提示" ;
        titleLab.textColor = [UIColor blackColor];
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab = titleLab;
        [self addSubview:titleLab];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 40, 25)];
        textField.placeholder = @"输入框";
        [self addSubview:textField];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLab.bounds = CGRectMake(0, 0, 100, 20);
    _titleLab.center = CGPointMake(CGRectGetWidth(self.frame) / 2, 20);

}

@end

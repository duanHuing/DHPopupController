//
//  DHPopupController.h
//  DHTest
//
//  Created by bangju on 2019/2/25.
//  Copyright © 2019年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,DHPopupControllerStyle) {
    DHPopupControllerStyleTop = 0 ,
    DHPopupControllerStyleLeft,
    DHPopupControllerStyleBottom ,
    DHPopupControllerStyleRight ,
    DHPopupControllerStyleCenter,
    DHPopupControllerStyleCustom    
};


NS_ASSUME_NONNULL_BEGIN

@interface DHPopupController : UIViewController

@property (nonatomic, strong, readonly) UIView *contentView;

/** 视图弹出风格 */
@property (nonatomic, assign) DHPopupControllerStyle style;

/** 触碰 mask view 时是否可以返回  默认开启 */
@property (nonatomic, assign) BOOL isDismissOnTouthMask;

/** maskView 与屏幕的间隔 默认没有间隔*/
@property (nonatomic, assign) UIEdgeInsets  maskViewInsets;

/** 动画持续时间 默认 0.25s */
@property (nonatomic, assign) CGFloat  duration;

/** popupView 的圆角 style = bottom/center/custom 时起效 */
@property (nonatomic, assign) CGFloat  contentViewCornerRadius;

- (void)showPopupView:(UIView*)popupView fromController:(UIViewController*)vc ;

- (void)dismiss ;


@end

NS_ASSUME_NONNULL_END

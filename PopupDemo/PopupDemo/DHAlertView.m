//
//  DHAlertView.m
//  PopupDemo
//
//  Created by bangju on 2019/2/28.
//  Copyright © 2019年 duan. All rights reserved.
//

#import "DHAlertView.h"

@implementation DHAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.text = @"提示" ;
        titleLab.textColor = [UIColor blackColor];
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLab];
        
        
        titleLab.translatesAutoresizingMaskIntoConstraints = NO;
        /*居中显示*/
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:10]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    }
    return self;
}


@end

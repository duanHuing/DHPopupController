//
//  ViewController.m
//  PopupDemo
//
//  Created by bangju on 2019/2/27.
//  Copyright © 2019年 duan. All rights reserved.
//

#import "ViewController.h"
#import "DHPopupController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fsfsfsf:(id)sender {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 500)];
    view.backgroundColor = [UIColor greenColor];
    
    DHPopupController *popup = [[DHPopupController alloc] init];
    popup.style = DHPopupControllerStyleBottom;
    popup.contentViewCornerRadius = 10;
    [popup showPopupView:view fromController:self];
}

@end

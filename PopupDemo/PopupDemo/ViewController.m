//
//  ViewController.m
//  PopupDemo
//
//  Created by bangju on 2019/2/27.
//  Copyright © 2019年 duan. All rights reserved.
//

#import "ViewController.h"
#import "DHPopupController.h"
#import "DHAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fsfsfsf:(id)sender {
    
    DHAlertView *view = [[DHAlertView alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    view.backgroundColor = [UIColor greenColor];
    
    DHPopupController *popup = [[DHPopupController alloc] init];
    popup.style = DHPopupControllerStyleBottom;
    popup.contentViewCornerRadius = 10;
    [popup showPopupView:view fromController:self];
}

@end

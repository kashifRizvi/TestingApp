//
//  ViewController.m
//  TestingApp
//
//  Created by Kashif on 05/10/16.
//  Copyright © 2016 Kashif. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger n=arc4random() % 9 + 1;
    n=2;
    
    switch (n) {
        case 1:
            [self showLabel];
            break;
        case 2:
            [self showButton];
        case 3:
            [self showImageView];
        case 4:
            [self showView];
        case 5:
            [self showSegmentedControl];
        case 6:
            [self showTextField];
        case 7:
            [self showSliderLabel];
        case 8:
            [self showSwitch];
        case 9:
            [self showActivityIndicator];
        case 10:
            [self showProgressView];
            
        default:
            break;
    }
}

- (void) showLabel{
    
}

- (void) showButton{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 20.0)];
    [button setTitle:@"Long Press" forState:UIControlStateNormal];
    
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClicked:)];
    [button addGestureRecognizer:longPress];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor cyanColor]];
    
    [self.view addSubview:button];
    
}

- (void) buttonClicked: (UIButton *) sender{
    if (sender.state==UIGestureRecognizerStateBegan) {
        UIAlertView *buttonAlert=[[UIAlertView alloc]initWithTitle:@"Button Pressed" message:@"Remove your finger from the Button." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [buttonAlert show];
        
    }
}

- (void) showImageView{
    
}

- (void) showView{
    
}

- (void) showSegmentedControl{
    
}

- (void) showTextField{
    
}

- (void) showSliderLabel{
    
}

- (void) showSwitch{
    
}

- (void) showActivityIndicator{
    
}

- (void) showProgressView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

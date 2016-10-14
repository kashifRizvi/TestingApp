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
UIPanGestureRecognizer *panGesture;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger n=arc4random() % 9 + 1;
    n=1;
    
    switch (n) {
        case 1:
            [self showLabel];
            break;
        case 2:
            [self showButton];
            break;
        case 3:
            [self showImageView];
            break;
        case 4:
            [self showView];
            break;
        case 5:
            [self showSegmentedControl];
            break;
        case 6:
            [self showTextField];
            break;
        case 7:
            [self showSliderLabel];
            break;
        case 8:
            [self showSwitch];
            break;
        case 9:
            [self showActivityIndicator];
            break;
        case 10:
            [self showProgressView];
            break;
            
        default:
            break;
    }
}

- (void) showLabel{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 20.0)];
    [label setText:@"Drag me!!"];
    [label setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:label];
    panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragLabel:)];
    panGesture.minimumNumberOfTouches = 1;
    [label addGestureRecognizer:panGesture];
}

- (void) dragLabel: (UIPanGestureRecognizer *) gesture{
    if (gesture.state==UIGestureRecognizerStateBegan) {
        NSLog(@"Dragging began!!");
    }
    if (gesture.state==UIGestureRecognizerStateEnded) {
        NSLog(@"Dragging Stopped!!");
    }
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
    if (sender.state == UIGestureRecognizerStateEnded) {
        UIAlertView *buttonAlert=[[UIAlertView alloc]initWithTitle:@"Button Pressed" message:@"Remove your finger from the Button." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [buttonAlert show];
    }
}

- (void) showImageView{
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 100.0)];
    imageView.image=[UIImage imageNamed:@"appleLogo.png"];
    imageView.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *longPressImage=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imagePressed:)];
    [imageView addGestureRecognizer:longPressImage];
    
    [self.view addSubview:imageView];
    
}

- (void) imagePressed: (UILongPressGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertView *imageAlert=[[UIAlertView alloc]initWithTitle:@"Image Long Pressed" message:@"Try Pressing with multiple fingers." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [imageAlert show];
    }
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

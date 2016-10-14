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
    n=3;
    
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
    label.userInteractionEnabled=YES;
    panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragLabel:)];
    panGesture.minimumNumberOfTouches = 1;
    [label addGestureRecognizer:panGesture];
}

- (void) dragLabel: (UIPanGestureRecognizer *) gesture{
    if (gesture.state==UIGestureRecognizerStateBegan) {
        
            NSLog(@"Dragging Began!!");
    }
    
    if (gesture.state==UIGestureRecognizerStateEnded) {
        UILabel *label=(UILabel *)gesture.view;
        CGPoint newPoint=[gesture translationInView:label];
        label.center=CGPointMake(label.center.x+newPoint.x, label.center.y+newPoint.y);
        
        [gesture setTranslation:CGPointZero inView:label];
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
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRecognized:)];
    [imageView addGestureRecognizer:tapGesture];
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

- (void) tapRecognized: (UITapGestureRecognizer *) sender{
        NSInteger numberOfTouches=sender.numberOfTouches;
        NSLog(@" touches number %i",numberOfTouches);
        UIAlertView *numberOfTouchesAlert;
        switch (numberOfTouches) {
            case 1:
                numberOfTouchesAlert=[[UIAlertView alloc]initWithTitle:@"One Finger Touch" message:@"Touched with one finger only." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
                break;
            case 2:
                numberOfTouchesAlert=[[UIAlertView alloc]initWithTitle:@"Two Finger Touch" message:@"Touched with Two fingers." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
                break;
            case 3:
                numberOfTouchesAlert=[[UIAlertView alloc]initWithTitle:@"Three Finger Touch" message:@"Touched with Three fingers." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
                break;
                
            default:
                break;
        }
        [numberOfTouchesAlert show];
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

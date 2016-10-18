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
UILabel *label;
UIProgressView *progressView;
UIActivityIndicatorView *activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger n=(arc4random() % 4) + 1 ;
    n=7;
    
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
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragLabel:)];
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
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertView *buttonAlert=[[UIAlertView alloc]initWithTitle:@"Button Pressed" message:@"Remove your finger from the Button." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [buttonAlert show];
    }
}

- (void) showImageView{
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 100.0)];
    imageView.image=[UIImage imageNamed:@"appleLogo.png"];
    imageView.userInteractionEnabled = YES;
    imageView.multipleTouchEnabled= YES;
    
    UITapGestureRecognizer *singleTapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapRecognized:)];
    [singleTapGesture setNumberOfTouchesRequired:1];
    [imageView addGestureRecognizer:singleTapGesture];
    
    UITapGestureRecognizer *doubleTapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapRecognized:)];
    [doubleTapGesture setNumberOfTouchesRequired:2];
    [imageView addGestureRecognizer:doubleTapGesture];
    
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

- (void) singleTapRecognized: (UITapGestureRecognizer *) sender{
    NSInteger numberOfTouches=sender.numberOfTouches;
    NSLog(@" Number of touches :  %li",numberOfTouches);
    UIAlertView *numberOfTouchesAlert;
    numberOfTouchesAlert=[[UIAlertView alloc]initWithTitle:@"One Finger Touch" message:@"Touched with one finger only." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [numberOfTouchesAlert show];
}

- (void) doubleTapRecognized: (UITapGestureRecognizer *) sender{
    NSInteger numberOfTouches=sender.numberOfTouches;
    NSLog(@" Number of touches :  %li",numberOfTouches);
    UIAlertView *numberOfTouchesAlert;
    numberOfTouchesAlert=[[UIAlertView alloc]initWithTitle:@"Two Finger Touch" message:@"Touched with Two fingers." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    
    [numberOfTouchesAlert show];
}

- (void) showView{
    UIView *pinchView=[[UIView alloc]initWithFrame:CGRectMake(80, 200, 100, 300)];
    [pinchView setBackgroundColor:[UIColor redColor]];
    pinchView.userInteractionEnabled=YES;
    pinchView.multipleTouchEnabled=YES;
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureAction:)];
    [[self view] addSubview:pinchView];
    [pinchView addGestureRecognizer:pinchGesture];
    
}

- (void) pinchGestureAction: (UIPinchGestureRecognizer *) sender{
    CGAffineTransform transform= CGAffineTransformMakeScale(sender.scale, sender.scale);
    sender.view.transform=transform;
}

- (void) showSegmentedControl{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    segmentedControl.backgroundColor=[UIColor redColor];
    [self.view addSubview:segmentedControl];
}

- (void) showTextField{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    textField.delegate=self;
    [self.view addSubview:textField];
    textField.backgroundColor=[UIColor orangeColor];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Return Key Pressed!" message:textField.text delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [textField resignFirstResponder];
    [alert show];
    return YES;
}

- (void) showSliderLabel{
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 20, 200, 30)];
    label = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 200, 50)];
    progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 150, 200, 20)];
    activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    slider.maximumValue=100;
    slider.minimumValue=0;
    NSLog(@"%f", slider.value);
    [slider addTarget:self action:@selector(sliderHandle:) forControlEvents:UIControlEventValueChanged];
    [slider addTarget:self action:@selector(sliderHandleStop:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [label setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:progressView];
    [self.view addSubview:activityIndicator];
}

- (void) sliderHandle: (UISlider *) sender{
    label.text=[NSString stringWithFormat:@"%.1f", sender.value];
    progressView.progress=sender.value/100;
    [activityIndicator startAnimating];
}

- (void) sliderHandleStop: (UISlider *) sender{
    [activityIndicator stopAnimating];
}


- (void) showSwitch{
    UISwitch *switchView= [[UISwitch alloc]initWithFrame:CGRectMake(100, 100, 50, 20)];
    [self.view addSubview:switchView];
    [switchView addTarget:self action:@selector(handleSwitch:) forControlEvents:UIControlEventValueChanged];
    
}

- (void) handleSwitch: (UISwitch *) sender{
    NSString *status;
    if (sender.isOn) {
        status=@"Switch is ON!";
    }
    else
        status=@"Switch is OFF!";
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Switched" message:status delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
    
}

- (void) showActivityIndicator{
    
}

- (void) showProgressView{
//    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

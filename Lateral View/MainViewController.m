//
//  MainViewController.m
//  Lateral View
//
//  Created by Hector Carrasco on 04-01-14.
//  Copyright (c) 2014 Hector Carrasco. All rights reserved.


#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController
@synthesize hiddenView;
NSUserDefaults *persistValues;
CGPoint location;
CGPoint locationImage;
UIImageView *tutorialImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Parameters of position of LateralMenuView : x = -94, y = 17 */
    // if is the iPhone 4+
    if([[UIScreen mainScreen] bounds].size.height == 480){
        CGFloat x = -80;
        CGFloat y = 254;
        location = CGPointMake(x, y);
        hiddenView.center = location;
    }
    // if is the iPhone 5+
    else{
        CGFloat x = -80;
        CGFloat y = 294;
        location = CGPointMake(x, y);
        hiddenView.center = location;
    }
    
    /* Here we set a little tutorial of the Lateral MenuView, the idea is that this tutorial only is shows in the first time that the application runs 
     */
    
    persistValues = [NSUserDefaults standardUserDefaults];
    
    if(![persistValues stringForKey:@"firstRun"]){
        
        // create the persisting value that tell us that if it is the first run
        [persistValues setObject:@"true" forKey:@"firstRun"];
        
        /* start tutorial code */
        // shows animation tutorial and set the initial parameters
        
        
        /* end tutorial code */
    }
    
    if([[UIScreen mainScreen] bounds].size.height == 480){
        
        tutorialImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touchb_.png"]];
        tutorialImage.frame = CGRectMake(-95, 254, 170, 100);
        [self.view addSubview:tutorialImage];
        
        CGFloat x = 100;
        CGFloat y = 254;
        location = CGPointMake(x, y);
        x = 200;
        y = 254;
        locationImage = CGPointMake(x, y);
    }
    else{
        tutorialImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touchb_.png"]];
        tutorialImage.frame = CGRectMake(-95, 254, 170, 100);
        [self.view addSubview:tutorialImage];
        
        CGFloat x = 100;
        CGFloat y = 294;
        location = CGPointMake(x, y);
        x = 200;
        y = 294;
        locationImage = CGPointMake(x, y);
    }
    
    [UIView animateWithDuration:1.5 delay:15 options:0 animations:^{
        hiddenView.center = location;
        tutorialImage.center = locationImage;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0.5 options:0 animations:^{
            tutorialImage.alpha = 0;
        } completion:^(BOOL finished) {
            [tutorialImage removeFromSuperview];
            [UIView animateWithDuration:0 delay:0.5 options:0 animations:^{
                
                /* Make here a dialog that give instructions */
                
            } completion:^(BOOL finished) {
                /* Making the back animation */
                if([[UIScreen mainScreen] bounds].size.height == 480){
                    tutorialImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touchc.png"]];
                    tutorialImage.frame = CGRectMake(125, 254, 110, 100);
                    [self.view addSubview:tutorialImage];
                    
                    CGFloat x = -80;
                    CGFloat y = 254;
                    location = CGPointMake(x, y);
                    x = 50;
                    y = 294;
                    locationImage = CGPointMake(x, y);
                }
                else{
                    tutorialImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touchc.png"]];
                    tutorialImage.frame = CGRectMake(125, 254, 110, 100);
                    [self.view addSubview:tutorialImage];
                    
                    CGFloat x = -80;
                    CGFloat y = 294;
                    location = CGPointMake(x, y);
                    x = 50;
                    y = 294;
                    locationImage = CGPointMake(x, y);
                }
                [UIView animateWithDuration:2.5 delay:1 options:0 animations:^{
                    hiddenView.center = location;
                    tutorialImage.center = locationImage;
                } completion:^(BOOL finished) {
                    tutorialImage.alpha = 0;
                    [tutorialImage removeFromSuperview];
                }];
            }];
        }];
    }];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    // If the touch was in the placardView, move the placardView to its location
    if ([touch view] == hiddenView) {
        CGPoint location = [touch locationInView:self.view];
        
        // if is the iPhone 4+
        if([[UIScreen mainScreen] bounds].size.height == 480){
            // set y coordinate
            if(location.y!=254){
                location.y = 254;
            }
            // set x coordinate
            if(location.x>80){
                location.x = 100;
            }
            if(location.x<20){
                location.x = -80;
            }
        }
        // if is the iPhone 5+
        else{
            // set y coordinate
            if(location.y!=294){
                location.y = 294;
            }
            // set x coordinate
            if(location.x>80){
                location.x = 100;
            }
            if(location.x<20){
                location.x = -80;
            }
        }
        
        // set the final location of the view with animation of 0.3 seconds
        [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
            hiddenView.center = location;
        } completion:^(BOOL finished) { }];
        return;
    }
}

@end
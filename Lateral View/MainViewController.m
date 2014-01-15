//
//  MainViewController.m
//  Lateral View
//
//  Created by Hector Carrasco on 04-01-14.
//  Copyright (c) 2014 Hector Carrasco. All rights reserved.
// x = -94, y = 17

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController
@synthesize hiddenView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // if is the iPhone 4+
    if([[UIScreen mainScreen] bounds].size.height == 480){
        CGFloat x = -80;
        CGFloat y = 254;
        CGPoint posicion = CGPointMake(x, y);
        hiddenView.center = posicion;
    }
    // if is the iPhone 5+
    else{
        CGFloat x = -80;
        CGFloat y = 294;
        CGPoint posicion = CGPointMake(x, y);
        hiddenView.center = posicion;
    }
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
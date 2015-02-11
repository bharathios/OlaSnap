//
//  ViewController.m
//  OlaSnap
//
//  Created by Bharath Nagaraj Rao on 11/02/15.
//  Copyright (c) 2015 Bharath Nagaraj Rao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize snapBehavior;
@synthesize animator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidLayoutSubviews
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // Create a snap behavior for the contentView.
    // The view will snap to the center of the view.
    CGPoint originalCenter = self.olaCabImage.center;
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.olaCabImage
                                                 snapToPoint:CGPointMake(originalCenter.x,originalCenter.y)];
    
}




#pragma mark - Gesture methods 




- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"Pan");
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        // Remove previously added snap behavior (if any).
        [self.animator removeBehavior:self.snapBehavior];
        if ([[[UIDevice currentDevice] systemVersion] floatValue]<8.0) {
            if (self.contentViewConstraints)
            {
                [self.view removeConstraints:self.contentViewConstraints];
            }
        }
        
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        // Calculate new center of the view based on the gesture recognizer's
        // translation.
        CGPoint newCenter = self.olaCabImage.center;
        newCenter.x += [gestureRecognizer translationInView:self.view].x;
        newCenter.y += [gestureRecognizer translationInView:self.view].y;
        
        // Set the new center of the view.
        self.olaCabImage.center = newCenter;
        
        // Reset the translation of the recognizer.
        [gestureRecognizer setTranslation:CGPointZero inView:self.view];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        // Dragging has ended.
        // Add snap behavior to the animator to move the view to it's starting
        // position with a nice snap movement.
        [self.animator addBehavior:self.snapBehavior];
    }

}


@end

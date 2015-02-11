//
//  ViewController.h
//  OlaSnap
//
//  Created by Bharath Nagaraj Rao on 11/02/15.
//  Copyright (c) 2015 Bharath Nagaraj Rao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>


// Snap behavior responsible for the snap movement of the contentView after the
// dragging gesture has ended.
@property(nonatomic, strong) UISnapBehavior *snapBehavior;

// Dynamic animator that will take care of animating the snap movement.
@property(nonatomic, strong) UIDynamicAnimator *animator;

@property (weak, nonatomic) IBOutlet UIImageView *olaCabImage;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *contentViewConstraints;

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer;


@end


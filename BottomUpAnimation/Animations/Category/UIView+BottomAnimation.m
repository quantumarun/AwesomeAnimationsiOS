//
//  UIView+BottomAnimation.m
//  Animation
//
//  Created by Arun on 3/17/16.
//  Copyright © 2016 Arun. All rights reserved.
//

#import "UIView+BottomAnimation.h"

@implementation UIView (BottomAnimation)

/**************************************************************************************
 Description: This function shows SlideOut animation from bottom and after few seconds hides it again.
 params:  NSString* Which denotes the mesaage to be displayed
 return: void.
 
 ****************************************************************************************/
-(void) messageSlideOut:(NSString*)titleMessage
{
    //This creates a UIView the main view
    UIView *messageView = [UIView new];
    messageView.translatesAutoresizingMaskIntoConstraints = false;
    messageView.backgroundColor = [UIColor grayColor];
    [self addSubview:messageView];
    //UILable to display the meesage. It is added as a subview of message View
    UILabel *messageLabel = [UILabel new];
    messageLabel.translatesAutoresizingMaskIntoConstraints = false;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = titleMessage;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    messageLabel.backgroundColor = [UIColor clearColor];
    [messageView addSubview: messageLabel];
    
    //Add the Constraint
    NSDictionary *views = NSDictionaryOfVariableBindings(messageView,messageLabel);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[messageView]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
    NSArray *cHeightZero = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[messageView(0)]-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views];
    [self addConstraints:cHeightZero];
    NSArray *cActualHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[messageView(60)]-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views];
    NSLayoutConstraint *centerXCons =  [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:messageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYCons =  [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:messageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [messageView addConstraint:centerXCons];
    [messageView addConstraint:centerYCons];

    [messageLabel sizeToFit];
    [self bringSubviewToFront:messageView];
    [self layoutIfNeeded];
    messageLabel = nil;
    
    //Perform the animation
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self removeConstraints:cHeightZero];
                         [self addConstraints:cActualHeight];
                         [self layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                               delay:2.5
                                             options: UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              [self removeConstraints:cActualHeight];
                                              [self addConstraints:cHeightZero];
                                              [self layoutIfNeeded];
                                             }
                                          completion:^(BOOL finished){
                                              [messageView removeFromSuperview];
                                          }];
                     }];
    
}

-(void) messageSlideOut:(NSString*)titleMessage withImage:(NSString*) showImage {
    //This creates a UIView the main view
    UIView *messageView = [UIView new];
    messageView.translatesAutoresizingMaskIntoConstraints = false;
    messageView.backgroundColor = [UIColor grayColor];
    [self addSubview:messageView];
    //UILable to display the meesage. It is added as a subview of message View
    UILabel *messageLabel = [UILabel new];
    messageLabel.translatesAutoresizingMaskIntoConstraints = false;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = titleMessage;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    messageLabel.backgroundColor = [UIColor clearColor];
    [messageView addSubview: messageLabel];
    
    
    //Add the Image
    UIImageView *addImage = [UIImageView new];
    addImage.translatesAutoresizingMaskIntoConstraints = false;
    [messageView addSubview:addImage];
    if(showImage) {
        addImage.image = [UIImage imageNamed:showImage];
    }
    
    //Add the Constraint
    NSDictionary *views = NSDictionaryOfVariableBindings(messageView,messageLabel, addImage);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[messageView]|" options:0 metrics:nil views:views]];
    NSArray *cHeightZero = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[messageView(0)]-|" options:0 metrics:nil views:views];
    [self addConstraints:cHeightZero];
    NSArray *cActualHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[messageView(60)]-|" options:0 metrics:nil views:views];
    [messageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[messageLabel]|" options:0 metrics:nil views:views]];
    [messageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[addImage(<=50)]" options:0 metrics:nil views:views]];
    [messageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(>=20)-[addImage(>=10)]-10-[messageLabel]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    
    NSLayoutConstraint *centerXCons =  [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:messageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYCons =  [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:messageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYImageCons =  [NSLayoutConstraint constraintWithItem:addImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:messageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [messageView addConstraint:centerXCons];
    [messageView addConstraint:centerYCons];
    [messageView addConstraint:centerYImageCons];
    
    [messageLabel sizeToFit];
    [self bringSubviewToFront:messageView];
    [self layoutIfNeeded];
    messageLabel = nil;
    
    //Perform the animation
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self removeConstraints:cHeightZero];
                         [self addConstraints:cActualHeight];
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                               delay:2.5
                                             options: UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              [self removeConstraints:cActualHeight];
                                              [self addConstraints:cHeightZero];
                                              [self layoutIfNeeded];
                                          } completion:^(BOOL finished){
                                              [messageView removeFromSuperview];
                                          }];
                     }];
}



@end

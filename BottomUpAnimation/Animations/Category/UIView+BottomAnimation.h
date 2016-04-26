//
//  UIView+BottomAnimation.h
//  Animation
//
//  Created by Arun on 3/17/16.
//  Copyright © 2016 Arun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BottomAnimation)

/**************************************************************************************
 Description: This function shows SlideOut animation from bottom and after few seconds hides it again.
 params:  NSString* Which denotes the mesaage to be displayed
 return: void.

****************************************************************************************/
-(void) messageSlideOut:(NSString*)titleMessage;
-(void) messageSlideOut:(NSString*)titleMessage withImage:(NSString*) showImage;
@end

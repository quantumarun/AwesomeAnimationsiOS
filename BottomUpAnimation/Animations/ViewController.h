//
//  ViewController.h
//  Animations
//
//  Created by Arun on 3/18/16.
//  Copyright © 2016 Arun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)btnWithoutImage:(UIButton *)sender;

- (IBAction)btnClick:(UIButton *)sender;

@end


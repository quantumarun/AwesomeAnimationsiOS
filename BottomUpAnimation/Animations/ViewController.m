//
//  ViewController.m
//  Animations
//
//  Created by Arun on 3/18/16.
//  Copyright © 2016 Arun. All rights reserved.
//

#import "ViewController.h"
#import "UIView+BottomAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btnWithoutImage:(UIButton *)sender {
    [self.view messageSlideOut:self.textField.text];
}

- (IBAction)btnClick:(UIButton *)sender {
    [self.view messageSlideOut:self.textField.text withImage:@"color1"];
}
@end

//
//  LoginViewController.m
//  Motolife
//
//  Created by Stas on 23.09.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "LoginViewController.h"
#import <MMDrawerController.h>

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    [self resetScrollFrame];
    [super viewWillDisappear:animated];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DRAWER_SEGUE"]) {
        MMDrawerController *destinationViewController = (MMDrawerController *) segue.destinationViewController;
        
        // Instantitate and set the center view controller.
        UIViewController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FEED_TOP_VIEW_CONTROLLER"];
        [destinationViewController setCenterViewController:centerViewController];
        
        // Instantiate and set the left drawer controller.
        UIViewController *leftDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SIDE_DRAWER_CONTROLLER"];
        [destinationViewController setLeftDrawerViewController:leftDrawerViewController];
        
    }
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - keyboards

- (void)keyboardWasShown:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    _bottomConstraint.constant = keyboardSize.height;
    [self.scrollView setContentOffset:CGPointMake(0, keyboardSize.height) animated:YES];
    [self.view layoutIfNeeded];    
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    [self resetScrollFrame];
}

- (void)resetScrollFrame
{
    _bottomConstraint.constant = 0;
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    [self.view layoutIfNeeded];
}

@end

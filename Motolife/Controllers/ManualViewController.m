//
//  ManualViewController.m
//  Motolife
//
//  Created by Stas on 13.10.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "ManualViewController.h"

@interface ManualViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ManualViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Yamaha R1 2009 Owners Manual" ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webView loadRequest:request];
}



@end

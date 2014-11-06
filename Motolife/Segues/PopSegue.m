//
//  PopSegue.m
//  Motolife
//
//  Created by Stas on 12.10.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "PopSegue.h"

@implementation PopSegue

- (void)perform
{
    [[(UIViewController *)self.sourceViewController navigationController] popViewControllerAnimated:YES];
}

@end

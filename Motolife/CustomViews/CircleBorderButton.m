//
//  CircleBorderButton.m
//  Motolife
//
//  Created by Stas on 07.11.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "CircleBorderButton.h"

@implementation CircleBorderButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBorder];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupBorder];
}

- (void)setupBorder
{
    CGFloat maxSize = MAX(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds));
    self.layer.cornerRadius = 0.5*maxSize;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.clipsToBounds = YES;
}

@end

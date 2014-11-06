//
//  CircleImageView.m
//  Motolife
//
//  Created by Stas on 23.09.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView

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
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

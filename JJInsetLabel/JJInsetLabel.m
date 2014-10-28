//
//  JJInsetLabel.m
//  Due2
//
//  Created by Lin Junjie on 28/10/14.
//  Copyright (c) 2014 Lin Junjie. All rights reserved.
//

// With code from http://stackoverflow.com/a/17557490/401329

#import "JJInsetLabel.h"

@implementation JJInsetLabel

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self)
	{
		_edgeInsets = UIEdgeInsetsZero;
	}
	
	return self;
}

#pragma mark - UIAppearance

- (void)setLabelFont:(UIFont *)labelFont
{
	self.font = labelFont;
}

- (void)setLabelBackgrondColor:(UIColor *)labelBackgrondColor
{
	self.backgroundColor = labelBackgrondColor;
}

- (void)setLabelTextColor:(UIColor *)labelTextColor
{
	self.textColor = labelTextColor;
}

- (UIFont *)labelFont
{
	return self.font;
}

- (UIColor *)labelBackgrondColor
{
	return self.backgroundColor;
}

- (UIColor *)labelTextColor
{
	return self.textColor;
}

#pragma mark - Drawing with Insets

- (void)drawTextInRect:(CGRect)rect
{
	[super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

#pragma mark - Sizing with Insets

- (CGSize)sizeThatFits:(CGSize)size
{
	size.width -= (self.edgeInsets.left + self.edgeInsets.right);
	CGSize fittingSize = [super sizeThatFits:size];
	fittingSize.height += (self.edgeInsets.top + self.edgeInsets.bottom);
	return fittingSize;
}

- (void)fitToWidth:(CGFloat)width
{
	CGSize fittingSize = [self sizeThatFits:CGSizeMake(width, 0)];
	CGRect frame = self.frame;
	frame.size = fittingSize;
	self.frame = frame;
}

// For auto-layout
- (CGSize)intrinsicContentSize
{
	CGSize size = [super intrinsicContentSize];
	size.width  += (self.edgeInsets.left + self.edgeInsets.right);
	size.height += (self.edgeInsets.top + self.edgeInsets.bottom);
	return size;
}

@end

//
//  JJInsetLabel.h
//  Due2
//
//  Created by Lin Junjie on 28/10/14.
//  Copyright (c) 2014 Lin Junjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJInsetLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets edgeInsets UI_APPEARANCE_SELECTOR;

/// Set the height of the frame based on the text content within the given width
- (void)fitToWidth:(CGFloat)width;

@end

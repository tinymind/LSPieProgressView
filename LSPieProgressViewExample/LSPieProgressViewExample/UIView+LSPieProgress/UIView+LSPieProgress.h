//
//  UIView+LSPieProgress.h
//
//  Created by lslin on 14-6-13.
//  Copyright (c) 2014年 lessfun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * The pei progress view.
 */
@interface LSPieProgressView : UIView

/**
 * The progress range from 0.0 to 1.0.
 */
@property (nonatomic) CGFloat progress;

/**
 * The border margin spacing. default is 0
 */
@property (nonatomic) CGFloat borderSpacing;

/**
 * The color of the progress, default is [UIColor clearColor]
 */
@property (nonatomic, strong) UIColor *progressColor;

/**
 * The color of background mask. default is (255, 255, 255, 0.5).
 */
@property (nonatomic, strong) UIColor *backgroundMaskColor;

@end

//======

/**
 * UIView category
 */
@interface UIView (LSPieProgress)

/**
 * Get LSPieProgressView to modify the property. 
 * @return LSPieProgressView, if not exists, will create a new one.
 */
- (LSPieProgressView *)progressView;

/**
 * Update the progress status.
 * @param progress is from 0 to 1. "1" means done。
 */
- (void)setProgress:(CGFloat)progress;

@end

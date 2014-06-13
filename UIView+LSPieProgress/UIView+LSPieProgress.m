//
//  UIView+Progress.m
//
//  Created by lslin on 14-6-13.
//  Copyright (c) 2014年 lessfun.com. All rights reserved.
//

#import "UIView+LSPieProgress.h"

static const int kLSPieProgressViewTag  = 201;

@implementation LSPieProgressView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _progress = 1.0;
        _borderSpacing = 0;
        _progressColor = [UIColor clearColor];
        _backgroundMaskColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        self.tag = kLSPieProgressViewTag;
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = MAX(0, progress);
    if (_progress >= 1) {
        [self removeFromSuperview];
    }

    [self setNeedsDisplay];
}

#pragma mark draw progress

- (void)drawRect:(CGRect)rect
{
    CGFloat progressStart = -M_PI_2;
    CGFloat progressEnd = (-M_PI_2 + M_PI * 2 * self.progress);
    //progress
    [self drawRect:rect withColor:_progressColor.CGColor startAngle:-M_PI_2 endAngle:progressEnd];
    
    //background
    [self drawRect:rect withColor:_backgroundMaskColor.CGColor startAngle:progressEnd endAngle:progressStart];
}

- (void)drawRect:(CGRect)rect withColor:(CGColorRef)cgColor startAngle:(CGFloat)start endAngle:(CGFloat)end
{
    CGFloat radius = MIN(CGRectGetHeight(rect), CGRectGetWidth(rect)) * 0.5 - _borderSpacing;
    CGFloat centerX = CGRectGetWidth(rect) * 0.5;
    CGFloat centerY = CGRectGetHeight(rect) * 0.5;
    
    CGContextRef progressContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(progressContext, cgColor);
    CGContextMoveToPoint(progressContext, centerX, centerY);
    CGContextAddArc(progressContext, centerX, centerY, radius, start, end, 0);
    CGContextClosePath(progressContext);
    CGContextFillPath(progressContext);
}

@end

//======

@implementation UIView (Progress)

- (LSPieProgressView *)progressView
{
    UIView *view = [self viewWithTag:kLSPieProgressViewTag];
    if (view && ![view isKindOfClass:[LSPieProgressView class]]) {
        return nil;
    }
    LSPieProgressView *progressOverlay = (LSPieProgressView *)view;
    if (!progressOverlay) {
        progressOverlay = [[LSPieProgressView alloc] initWithFrame:self.bounds];
        [self addSubview:progressOverlay];
    }
    return progressOverlay;
}

- (void)setProgress:(CGFloat)progress
{
    [[self progressView] setProgress:progress];
}

@end

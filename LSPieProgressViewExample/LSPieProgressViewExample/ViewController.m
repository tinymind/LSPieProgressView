//
//  ViewController.m
//  LSPieProgressViewExample
//
//  Created by lslin on 14-6-13.
//  Copyright (c) 2014年 lessfun. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+LSPieProgress.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (assign, nonatomic) CGFloat progress;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _progress = 0;
    [self setButtonToRound:self.button1];
    [self setButtonToRound:self.button2];
    [self setButtonToRound:self.button3];
    
    [self performSelector:@selector(updateProgress) withObject:nil afterDelay:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)setButtonToRound:(UIButton *)btn
{
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.frame.size.width / 2.0;
}

- (void)updateProgress
{
    _progress += 0.05;
    [self.button1 setProgress:self.progress];
    [self.button2 setProgress:self.progress / 2.0];
    [self.button3 setProgress:self.progress / 3.0];
    
    if (_progress < 1) {
        [self performSelector:@selector(updateProgress) withObject:nil afterDelay:1];
    }
}


@end

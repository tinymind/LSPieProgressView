//
//  ViewController.m
//  LSProgressViewExample
//
//  Created by lslin on 14/11/3.
//  Copyright (c) 2014年 LessFun.com. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Progress.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;

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
    
    [self.button4 rectProgressView].progressColor = [UIColor colorWithRed:255/255.0 green:40/255.0 blue:0 alpha:1];
    [self.button5 rectProgressView].progressColor = [UIColor colorWithRed:0/255.0 green:156/255.0 blue:255/255.0 alpha:1];
    
    [self updateProgress];
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
    [self.button1 setPieProgress:self.progress];
    [self.button2 setPieProgress:self.progress / 2.0];
    [self.button3 setPieProgress:self.progress / 3.0];
    [self.button4 setRectProgress:self.progress / 2.0];
    [self.button5 setRectProgress:self.progress / 3.0];
    
    if (_progress < 1) {
        [self performSelector:@selector(updateProgress) withObject:nil afterDelay:1];
    }
}

@end

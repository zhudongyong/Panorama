//
//  SpinVC.m
//  PanoramaDemo
//
//  Created by zhudongyong on 14-7-9.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#import "SpinVC.h"
#import <PanoramShow/SpinImageView.h>

@interface SpinVC ()<SpinImageViewDelegate>
@property (nonatomic, strong) IBOutlet SpinImageView    *spinIV;
@property (nonatomic, strong) IBOutlet UIButton         *moveStatusBtn;
@property (nonatomic, strong) IBOutlet UIButton         *autoPlayStatusBtn;

- (IBAction)moveStatus:(id)sender;

- (IBAction)autoPlayStatus:(id)sender;

- (IBAction)back:(id)sender;

@end

@implementation SpinVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.spinIV = [[SpinImageView alloc] initWithFrame:self.view.bounds];
    self.spinIV.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.spinIV.delegate = self;
    [self.view insertSubview:self.spinIV atIndex:0];
    
    NSMutableArray *imageNames = [NSMutableArray array];
    for (int index = 0; index <= 150; index++) {
        [imageNames addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%05d.jpg", index] ofType:nil]];
    }
    self.spinIV.imageNames = imageNames;
    
    [self.spinIV prepareToPlay];
    
    self.moveStatusBtn.enabled         = NO;
    self.autoPlayStatusBtn.enabled     = YES;
    self.spinIV.enablePanGesture = YES;
}

- (void)dealloc {
    [self.spinIV stop];
    self.spinIV.delegate = nil;
    self.spinIV = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - IBAction
- (IBAction)moveStatus:(id)sender {
    [self.spinIV stop];
    self.spinIV.enablePanGesture = YES;
    
    self.moveStatusBtn.enabled         = NO;
    self.autoPlayStatusBtn.enabled     = YES;
}

- (IBAction)autoPlayStatus:(id)sender {
    self.spinIV.enablePanGesture = NO;
    [self.spinIV play];
    
    self.moveStatusBtn.enabled         = YES;
    self.autoPlayStatusBtn.enabled     = NO;
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -  SpinImageViewDelegate
- (void)spinImageViewDidFinish:(SpinImageView*)spinImageView {
    [self moveStatus:nil];
}

@end

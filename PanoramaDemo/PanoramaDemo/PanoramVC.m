//
//  PanoramVC.m
//  PanoramaDemo
//
//  Created by zhudongyong on 14-7-9.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#import "PanoramVC.h"
#import <PanoramShow/SphereView.h>

@interface PanoramVC ()<SphereViewDelegate>
@property (nonatomic, strong) SphereView *panoramView;

@end

@implementation PanoramVC

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
    
    self.panoramView = [[SphereView alloc] initWithFrame:self.view.bounds];
    self.panoramView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:self.panoramView atIndex:0];
    
    self.panoramView.radianXAreaMax = 45;
    self.panoramView.radianXAreaMin = -45;
    self.panoramView.zoom = 1;
    self.panoramView.radius = 1024;
    self.panoramView.radian = (SphereRadian){0, 0, 0};
    
    [self.panoramView setImagesWithPackageName:@"Package.bundle"];
    
    [self.panoramView updateRadian:(SphereRadian){0, 0, 0} animated:YES];
    self.panoramView.delegate = self;
    
    __block PanoramVC *vc = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [vc.panoramView play];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

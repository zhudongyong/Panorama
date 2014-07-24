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
    [self.panoramView addObjectWithImages:@[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button01.png" ofType:nil]],
//                                            [UIImage imageNamed:@"Button02.png"],
//                                            [UIImage imageNamed:@"Button03.png"]
                                            ]
                                     face:SphereFaceBack
                                      pos:(CGPoint){0.5, 0.4}
                                     size:(CGSize){0.04, 0.04}
                            animationType:AnimationTypeUpDown];
    [self.panoramView addObjectWithImages:@[
//                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button01.png" ofType:nil]],
                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button02.png" ofType:nil]],
//                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button03.png" ofType:nil]]
                                            ]
                                     face:SphereFaceFront
                                      pos:(CGPoint){0.1, 0.42}
                                     size:(CGSize){0.04, 0.04}
                            animationType:AnimationTypeScale];
    [self.panoramView addObjectWithImages:@[
//                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button01.png" ofType:nil]],
//                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button02.png" ofType:nil]],
                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button03.png" ofType:nil]]
                                            ]
                                     face:SphereFaceRight
                                      pos:(CGPoint){0.1, 0.42}
                                     size:(CGSize){0.04, 0.04}
                            animationType:AnimationTypeScale];
    [self.panoramView addObjectWithImages:@[
                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button01.png" ofType:nil]],
                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button02.png" ofType:nil]],
                                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button03.png" ofType:nil]]
                                            ]
                                     face:SphereFaceLeft
                                      pos:(CGPoint){0.05, 0.37}
                                     size:(CGSize){0.04, 0.04}
                            animationType:AnimationTypeChangeImage];
    
    [self.panoramView updateRadian:(SphereRadian){0, 0, 0} animated:YES];
    self.panoramView.delegate = self;
    self.panoramView.enableScaleGesture = YES;
    
    [self.panoramView startUpdate];
    
    __block PanoramVC *vc = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        @autoreleasepool {
            [vc.panoramView play];
//        }
//    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)dealloc {
    [self.panoramView endUpdate];
}

#pragma mark - IBAction

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
- (void)sphereView:(SphereView *)sphereView receivedTapActionForObjectAtIndex:(NSUInteger)index {
    [[[UIAlertView alloc] initWithTitle:@"按钮事件"
                                message:[NSString stringWithFormat:@"第 %d 个按钮被点击!", (int)index+1]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
}


@end

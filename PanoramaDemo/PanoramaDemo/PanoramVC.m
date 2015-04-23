//
//  PanoramVC.m
//  PanoramaDemo
//
//  Created by zhudongyong on 14-7-9.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#import "PanoramVC.h"
#import <PanoramShow/SphereView.h>

@interface PanoramVC ()<SphereViewDelegate> {
    NSUInteger  _currentIndex;
}
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
    self.panoramView.radius = 1024/3;
    self.panoramView.radian = (SphereRadian){0, 0, 0};
    
    _currentIndex = 1;
    
    [self updatePanorama];
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

#pragma mark - Update
- (void)updatePanorama {
    if (self.panoramView.isUpdating) {
        [self.panoramView endUpdate];
    }
    
    [self.panoramView removeAllObjects];
    
    switch (_currentIndex) {
        case 11: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            //Back
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.74, 0.38}
                                            size:(CGSize){0.08, 0.025}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:-M_PI_4/4.7];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceLeft
                                             pos:(CGPoint){0.20, 0.26}
                                            size:(CGSize){0.08, 0.03}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.18, 0.33}
                                            size:(CGSize){0.08, 0.03}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceLeft
                                             pos:(CGPoint){0.59, 0.415}
                                            size:(CGSize){0.08, 0.03}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceLeft
                                             pos:(CGPoint){0.89, 0.415}
                                            size:(CGSize){0.08, 0.03}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            
            break;
        }
        case 111: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.2, 0.35}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:8/180.0*M_PI_4];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.3, 0.3}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:8/180.0*M_PI_4];
            
            break;
        }
        case 1111: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceBack
                                             pos:(CGPoint){0.33, 0.25}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceBack
                                             pos:(CGPoint){0.66, 0.25}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 112: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.8, 0.35}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:-10/180.0*M_PI];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.7, 0.25}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:-10/180.0*M_PI];
            break;
        }
        case 1121: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.61, 0.12}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.35, 0.09}
                                            size:(CGSize){0.08, 0.028}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 113: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceLeft
                                             pos:(CGPoint){0.52, 0.39}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceLeft
                                             pos:(CGPoint){0.57, 0.33}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 1131: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.5, 0.1}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.75, 0.05}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 114: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.69, 0.32}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.62, 0.25}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 1141: {
            [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%d@2x.bundle", (int)_currentIndex]];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.26, 0.05}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceFront
                                             pos:(CGPoint){0.5, 0.15}
                                            size:(CGSize){0.084, 0.034}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:0];
            break;
        }
        case 1:
        default: {
            [self.panoramView setImagesWithPackageName:@"1@2x.bundle"];
            
            [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                            face:SphereFaceRight
                                             pos:(CGPoint){0.05, 0.35}
                                            size:(CGSize){0.08, 0.025}
                                           scale:(CGSize){0.5, 0.5}
                                       transform:(CGSize){0, 0.02}
                                          rotate:M_PI_4/4.42];
            
            break;
        }
    }
    
    [self.panoramView updateRadian:(SphereRadian){0, 0, 0} animated:YES];
    self.panoramView.delegate = self;
    self.panoramView.enableScaleGesture = YES;
    
    [self.panoramView startUpdate];
    [self.panoramView play];
}

#pragma mark -
- (void)sphereView:(SphereView *)sphereView receivedTapActionForObjectAtIndex:(NSUInteger)index {
    switch (_currentIndex) {
        case 1: {
            _currentIndex = 11;
            [self updatePanorama];
            break;
        }
        case 11: {
            if (index == 0) {
                _currentIndex = 1;
            }else if (index == 1) {
                _currentIndex = 111;
            }else if (index == 2) {
                _currentIndex = 112;
            }else if (index == 3) {
                _currentIndex = 113;
            }else if (index == 4) {
                _currentIndex = 114;
            }
            [self updatePanorama];
            break;
        }
        case 111:
        case 112:
        case 113:
        case 114: {
            if (index == 0) {
                _currentIndex = _currentIndex/10;
            }else if (index == 1) {
                _currentIndex = _currentIndex*10 + 1;
            }
            [self updatePanorama];
            break;
        }
        case 1111:
        case 1121:
        case 1131:
        case 1141: {
            if (index == 0) {
                _currentIndex = _currentIndex/10;
            }else if (index == 1) {
                _currentIndex = 11;
            }
            [self updatePanorama];
            break;
        }
        default:
            break;
    }
}


@end

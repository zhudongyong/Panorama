//
//  PanoramVC.m
//  PanoramaDemo
//
//  Created by zhudongyong on 14-7-9.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#import "PanoramVC.h"
#import <PanoramShow/SphereView.h>
#import "PanoramMenuView.h"

@interface PanoramVC ()<SphereViewDelegate>
@property (nonatomic, copy) NSString *posString;
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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.panoramView = [[SphereView alloc] initWithFrame:self.view.bounds];
    self.panoramView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:self.panoramView atIndex:0];
    
    self.panoramView.radianXAreaMax = 45;
    self.panoramView.radianXAreaMin = -45;
    self.panoramView.zoom = 1;
    self.panoramView.radius = 1024;
    self.panoramView.radian = (SphereRadian){0, 0, 0};
    
    self.posString = @"一楼客厅";
    
    [self updatePanorama];
    
    PanoramMenuView *menuView = [PanoramMenuView menuView];
    menuView.items = @[@{@"Key":@"一楼客厅",
                         @"ImageName":@"一楼客厅.bundle/Right.jpg",
                         @"Title":@"(一层)客厅"},
                       @{@"Key":@"一楼娱乐室",
                         @"ImageName":@"一楼娱乐室.bundle/Right.jpg",
                         @"Title":@"(一层)娱乐室"},
                       @{@"Key":@"一楼钢琴室",
                         @"ImageName":@"一楼钢琴室.bundle/Right.jpg",
                         @"Title":@"(一层)钢琴室"},
                       @{@"Key":@"一楼台球室",
                         @"ImageName":@"一楼台球室.bundle/Right.jpg",
                         @"Title":@"(一层)台球室"},
                       @{@"Key":@"一楼浴室",
                         @"ImageName":@"一楼浴室.bundle/Right.jpg",
                         @"Title":@"(一层)浴室"},
                       @{@"Key":@"二楼客厅",
                         @"ImageName":@"二楼客厅.bundle/Right.jpg",
                         @"Title":@"(二层)客厅"},
                       @{@"Key":@"二楼大厅",
                         @"ImageName":@"二楼大厅.bundle/Right.jpg",
                         @"Title":@"(二层)大厅"},
                       @{@"Key":@"二楼餐厅",
                         @"ImageName":@"二楼餐厅.bundle/Right.jpg",
                         @"Title":@"(二层)餐厅"},
                       @{@"Key":@"二楼卧室",
                         @"ImageName":@"二楼卧室.bundle/Right.jpg",
                         @"Title":@"(二层)卧室"},
                       @{@"Key":@"三楼客厅",
                         @"ImageName":@"三楼客厅.bundle/Right.jpg",
                         @"Title":@"(三层)客厅"},
                       @{@"Key":@"三楼书房",
                         @"ImageName":@"三楼书房.bundle/Right.jpg",
                         @"Title":@"(三层)书房"},
                       @{@"Key":@"三楼浴室",
                         @"ImageName":@"三楼浴室.bundle/Right.jpg",
                         @"Title":@"(三层)浴室"},
                       @{@"Key":@"三楼大卧室",
                         @"ImageName":@"三楼大卧室.bundle/Right.jpg",
                         @"Title":@"(三层)大卧室"},
                       @{@"Key":@"三楼小卧室",
                         @"ImageName":@"三楼小卧室.bundle/Right.jpg",
                         @"Title":@"(三层)小卧室"},
                       @{@"Key":@"三楼儿童房",
                         @"ImageName":@"三楼儿童房.bundle/Right.jpg",
                         @"Title":@"(三层)儿童房"},];
    menuView.hander = ^(NSDictionary *item) {
        self.posString = item[@"Key"];
        
        [self updatePanorama];
    };
    menuView.expanHander = ^(PanoramMenuView *view, BOOL isExpan) {
        [UIView animateWithDuration:0.3 animations:^{
            if (isExpan) {
                view.frame = CGRectMake(0, self.view.bounds.size.height - view.bounds.size.height,
                                        self.view.bounds.size.width,
                                        180);
            }else {
                view.frame = CGRectMake(0, self.view.bounds.size.height - 30,
                                        self.view.bounds.size.width,
                                        180);
            }
        }];
    };
    menuView.frame = CGRectMake(0, self.view.bounds.size.height - 30,
                                self.view.bounds.size.width,
                                180);
    [self.view addSubview:menuView];
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
    
    [self.panoramView setImagesWithPackageName:[NSString stringWithFormat:@"%@.bundle", self.posString]];
    
    if ([self.posString isEqualToString:@"一楼客厅"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.35, 0.4}
                                        size:(CGSize){0.08, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.75, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼浴室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.1, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼娱乐室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.4, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼台球室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceFront
                                         pos:(CGPoint){0.1, 0.25}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼钢琴室"];
    }else if ([self.posString isEqualToString:@"一楼台球室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.22, 0.2}
                                        size:(CGSize){0.08, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼钢琴室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.8, 0.2}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceFront
                                         pos:(CGPoint){0.2, 0.15}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼娱乐室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.25, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.68, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼浴室"];
    }else if ([self.posString isEqualToString:@"一楼娱乐室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceFront
                                         pos:(CGPoint){0.45, 0.1}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼客厅"];
    }else if ([self.posString isEqualToString:@"一楼浴室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceFront
                                         pos:(CGPoint){0.22, 0.08}
                                        size:(CGSize){0.08, 0.03}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼客厅"];
    }else if ([self.posString isEqualToString:@"一楼钢琴室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.25, 0.2}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.35, 0.4}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.8, 0.2}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼台球室"];
    }else if ([self.posString isEqualToString:@"二楼卧室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.6, 0.22}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
    }else if ([self.posString isEqualToString:@"二楼大厅"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.85, 0.5}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼书房"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.4, 0.35}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼卧室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.05, 0.25}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
    }else if ([self.posString isEqualToString:@"二楼客厅"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.1, 0.35}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼大厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.2, 0.4}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼卧室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.3, 0.32}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼餐厅"];
    }else if ([self.posString isEqualToString:@"二楼餐厅"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.7, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.95, 0.35}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"一楼客厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.95, 0.55}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼客厅"];
    }else if ([self.posString isEqualToString:@"三楼客厅"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.92, 0.1}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼小卧室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.8, 0.1}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼书房"];
    }else if ([self.posString isEqualToString:@"三楼大卧室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.1, 0.1}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼书房"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceLeft
                                         pos:(CGPoint){0.6, 0.2}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼浴室"];
    }else if ([self.posString isEqualToString:@"三楼小卧室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.06, 0.05}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼客厅"];
    }else if ([self.posString isEqualToString:@"三楼浴室"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.05, 0.05}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼大卧室"];
    }else if ([self.posString isEqualToString:@"三楼书房"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceBack
                                         pos:(CGPoint){0.45, 0.3}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"二楼大厅"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.45, 0.25}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼大卧室"];
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.9, 0.25}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼儿童房"];
    }else if ([self.posString isEqualToString:@"三楼儿童房"]) {
        [self.panoramView addObjectWithImage:[UIImage imageNamed:@"hotspot_arrow.png"]
                                        face:SphereFaceRight
                                         pos:(CGPoint){0.9, 0.2}
                                        size:(CGSize){0.07, 0.025}
                                       scale:(CGSize){0.5, 0.5}
                                   transform:(CGSize){0, 0.02}
                                      rotate:0
                                         key:@"三楼儿童房"];
    }
    
    [self.panoramView updateRadian:(SphereRadian){0, 0, 0} animated:YES];
    self.panoramView.delegate = self;
    self.panoramView.enableScaleGesture = YES;
    
    [self.panoramView startUpdate];
    [self.panoramView play];
}

#pragma mark -
- (void)sphereView:(SphereView *)sphereView
receivedTapActionForObjectAtIndex:(NSUInteger)index
        localPoint:(CGPoint)point
               key:(NSString *)key {
    self.posString = key;
    
    [self updatePanorama];
}

- (void)sphereView:(SphereView*)sphereView receivedActionInPosition:(CGPoint)position {
    NSLog(@"%@", [NSValue valueWithCGPoint:position]);
}

- (void)sphereView:(SphereView*)sphereView receivedActionInFace:(SphereFace)face
          position:(CGPoint)position {
    NSLog(@"%lu - %@", face, [NSValue valueWithCGPoint:position]);
}


@end

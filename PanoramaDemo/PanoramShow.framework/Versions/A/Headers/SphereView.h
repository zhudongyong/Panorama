//
//  SphereView.h
//  3DRenderDemo
//
//  Created by innovator on 14-6-15.
//  Copyright (c) 2014年 kdanmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SphereTypes.h"


@protocol SphereViewDelegate;
@class RenderObject;
@interface SphereView : UIView 
@property (nonatomic, strong) UIImage   *frontImage;
@property (nonatomic, strong) UIImage   *leftImage;
@property (nonatomic, strong) UIImage   *backImage;
@property (nonatomic, strong) UIImage   *rightImage;
@property (nonatomic, strong) UIImage   *upImage;
@property (nonatomic, strong) UIImage   *downImage;

@property (nonatomic, readwrite) float          radius;//Default 1024
@property (nonatomic, readwrite) SphereRadian   radian;//

@property (nonatomic) float zoom;   //Default is 1.0
@property (nonatomic) float minZoom;//Default is 0.4
@property (nonatomic) float maxZoom;//Default is 3

@property (nonatomic) float     radianXAreaMax;//Default is 45
@property (nonatomic) float     radianXAreaMin;//Default is -45

@property (nonatomic) float     anglePerPixX;//Default is 1/150.0
@property (nonatomic) float     anglePerPixY;//Default is 1/150.0

@property (nonatomic) BOOL  enableScaleGesture;//Default is YES.

@property (nonatomic, readonly) BOOL isUpdating;//实时更新状态
@property (nonatomic, readonly) BOOL isPlay;

@property (nonatomic, assign) id<SphereViewDelegate> delegate;

- (void)setImagesWithPackageName:(NSString*)packageName;

- (void)startUpdate;

- (void)play;

- (void)stop;

- (void)endUpdate;

- (void)updateRadian:(SphereRadian)radian animated:(BOOL)animated;

@end


@interface SphereView (Objects)

- (NSArray*)objects;

//Images Change Animation
- (BOOL)addObjectWithImages:(NSArray*)images
                       face:(SphereFace)face
                        pos:(CGPoint)position    //[0, 1]
                       size:(CGSize)size;

//Scale | Transform | rotate Animation
- (BOOL)addObjectWithImage:(UIImage*)images
                      face:(SphereFace)face
                       pos:(CGPoint)position    //[0, 1]
                      size:(CGSize)size         //[0, 1]
                     scale:(CGSize)scale
                 transform:(CGSize)transform
                    rotate:(float)radian;

- (BOOL)addObjectWithImages:(NSArray*)images
                       face:(SphereFace)face
                        pos:(CGPoint)position    //[0, 1]
                       size:(CGSize)size         //[0, 1]
              animationType:(AnimationType)animationType;

- (BOOL)removeObject:(RenderObject*)object;

- (BOOL)removeObjectAtIndex:(NSUInteger)index;

- (void)removeAllObjects;

@end


@protocol SphereViewDelegate <NSObject>
@optional
- (void)sphereView:(SphereView*)sphereView receivedActionInPosition:(CGPoint)position;

- (void)sphereView:(SphereView*)sphereView receivedActionInFace:(SphereFace)face position:(CGPoint)position;

- (void)sphereView:(SphereView *)sphereView receivedTapActionForObjectAtIndex:(NSUInteger)index;

@end

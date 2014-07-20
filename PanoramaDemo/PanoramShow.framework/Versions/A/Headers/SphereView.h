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

@property (nonatomic, readwrite) float          radius;
@property (nonatomic, readwrite) SphereRadian   radian;

@property (nonatomic) float zoom;

@property (nonatomic) float     radianXAreaMax;
@property (nonatomic) float     radianXAreaMin;

@property (nonatomic) float     anglePerPixX;
@property (nonatomic) float     anglePerPixY;

@property (nonatomic) BOOL isPlay;

@property (nonatomic, assign) id<SphereViewDelegate> delegate;

- (void)setImagesWithPackageName:(NSString*)packageName;

- (void)play;

- (void)stop;

- (void)updateRadian:(SphereRadian)radian animated:(BOOL)animated;

@end


@interface SphereView (Objects)

- (NSArray*)objects;

- (BOOL)addObjectWithImages:(NSArray*)images
                       face:(SphereFace)face
                        pos:(CGPoint)position    //[0, 1]
                       size:(CGSize)size         //[0, 1]
              animationType:(AnimationType)animationType;

- (BOOL)removeObject:(RenderObject*)object;

- (BOOL)removeObjectAtIndex:(NSUInteger)index;

@end


@protocol SphereViewDelegate <NSObject>
@optional
- (void)sphereView:(SphereView*)sphereView receivedActionInPosition:(CGPoint)position;

- (void)sphereView:(SphereView*)sphereView receivedActionInFace:(SphereFace)face position:(CGPoint)position;

- (void)sphereView:(SphereView *)sphereView receivedTapActionForObjectAtIndex:(NSUInteger)index;

@end

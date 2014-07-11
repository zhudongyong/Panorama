//
//  SphereView.h
//  3DRenderDemo
//
//  Created by innovator on 14-6-15.
//  Copyright (c) 2014年 kdanmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    float x;
    float y;
    float z;
}SphereRadian;

@protocol SphereViewDelegate;

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


typedef NS_ENUM(NSUInteger, SphereFace) {
    SphereFaceFront,
    SphereFaceLeft,
    SphereFaceBack,
    SphereFaceRight,
    SphereFaceUp,
    SphereFaceDown,
};

@protocol SphereViewDelegate <NSObject>
@optional
- (void)sphereView:(SphereView*)sphereView receivedActionInPosition:(CGPoint)position;

- (void)sphereView:(SphereView*)sphereView receivedActionInFace:(SphereFace)face position:(CGPoint)position;

@end

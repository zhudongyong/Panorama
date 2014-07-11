//
//  SpinImageView.h
//  ScanPlayViewDemo
//
//  Created by innovator on 14-6-8.
//  Copyright (c) 2014年 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PlayViewStatus) {
    PlayViewStatusNormal,
    PlayViewStatusPlay,
    PlayViewStatusPause,
    PlayViewStatusStop
};

@protocol SpinImageViewDelegate;

@interface SpinImageView : UIView
@property (nonatomic, strong) NSArray   *imageNames;
@property (nonatomic) NSInteger         indexOfDisplay;
@property (nonatomic) BOOL              loop;
@property (nonatomic) PlayViewStatus    status;
@property (nonatomic) double            fps;
@property (nonatomic) CGFloat           framePerPix;

@property (nonatomic) BOOL              enableTapGesture;
@property (nonatomic) BOOL              enablePanGesture;
@property (nonatomic) BOOL              pauseWhenPan;

@property (nonatomic, assign) id<SpinImageViewDelegate> delegate;

- (void)prepareToPlay;

- (BOOL)play;

- (void)pause;

- (void)stop;

@end


@protocol SpinImageViewDelegate <NSObject>
@optional
- (void)spinImageViewDidBegin:(SpinImageView*)spinImageview;

- (void)spinImageView:(SpinImageView*)spinImageView didDisplayIndex:(NSUInteger)index;

- (void)spinImageViewDidFinish:(SpinImageView*)spinImageView;

@end
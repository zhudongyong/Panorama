//
//  SphereTypes.h
//  SphereView
//
//  Created by zhudongyong on 14-7-19.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#ifndef SphereView_SphereTypes_h
#define SphereView_SphereTypes_h

typedef struct {
    float x;
    float y;
    float z;
}SphereRadian;

typedef NS_ENUM(NSUInteger, SphereFace) {
    SphereFaceFront,
    SphereFaceLeft,
    SphereFaceBack,
    SphereFaceRight,
    SphereFaceUp,
    SphereFaceDown,
};

typedef NS_ENUM(NSUInteger, AnimationType) {
    AnimationTypeNone,
    AnimationTypeInOut,
    AnimationTypeUpDown,
    AnimationTypeChangeImage,
    AnimationTypeScale,
};

#endif

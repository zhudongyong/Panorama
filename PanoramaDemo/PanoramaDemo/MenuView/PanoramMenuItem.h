//
//  PanoramMenuItem.h
//  TestPanarom
//
//  Created by dongyongzhu on 16/1/24.
//  Copyright © 2016年 innovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PanoramMenuItem;
typedef void(^MenuItemSelectHander) (PanoramMenuItem *item);
@interface PanoramMenuItem : UIView
@property (nonatomic,strong) NSDictionary *item;
@property (nonatomic, copy) MenuItemSelectHander hander;
@property (nonatomic) BOOL selected;

+ (PanoramMenuItem*)item;

@end

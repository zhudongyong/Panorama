//
//  PanoramMenuView.h
//  TestPanarom
//
//  Created by dongyongzhu on 16/1/24.
//  Copyright © 2016年 innovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PanoramMenuView;
typedef void(^PanoramMenuSelectHander) (NSDictionary *item);
typedef void(^PanoramMenuExpanHander) (PanoramMenuView *view, BOOL isExpan);
@interface PanoramMenuView : UIView
/** Title,Key,ImageName
 */
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) PanoramMenuSelectHander hander;
@property (nonatomic, copy) PanoramMenuExpanHander  expanHander;

+ (PanoramMenuView*)menuView;

@end

//
//  PanoramMenuView.m
//  TestPanarom
//
//  Created by dongyongzhu on 16/1/24.
//  Copyright © 2016年 innovator. All rights reserved.
//

#import "PanoramMenuView.h"
#import "PanoramMenuItem.h"

@interface PanoramMenuView ()
@property (nonatomic, strong) IBOutlet UIScrollView *scroll;
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, strong) IBOutlet UIButton     *selectBtn;

@end

@implementation PanoramMenuView

- (void)layoutSubviews {
    [self updateViews];
}

+ (PanoramMenuView*)menuView {
    return [[[NSBundle mainBundle] loadNibNamed:@"PanoramMenuView" owner:nil options:nil] lastObject];
}

#pragma mark - Setter
- (void)setItems:(NSArray *)items {
    _items = items;
    
    if (!self.views) {
        self.views = [NSMutableArray array];
    }
    
    while (self.views.count != _items.count) {
        if (self.views.count > _items.count) {
            [[self.views lastObject] removeFromSuperview];
            [self.views removeLastObject];
        }else {
            PanoramMenuItem *item = [PanoramMenuItem item];
            item.hander = ^(PanoramMenuItem *item) {
                if (self.hander) {
                    self.hander(item.item);
                }
            };
            [self.scroll addSubview:item];
            [self.views addObject:item];
        }
    }
    
    [self updateDatas];
    [self updateViews];
}

#pragma mark - Update
- (void)updateDatas {
    for (int index = 0; index < self.views.count; index++) {
        PanoramMenuItem *item = self.views[index];
        
        item.item = self.items[index];
    }
}

- (void)updateViews {
    float width = self.scroll.frame.size.height /4 * 6;
    CGSize size = CGSizeMake(self.views.count * (width + 10),
                             self.scroll.frame.size.height);
    self.scroll.contentSize = size;
    
    for (int index = 0; index < self.views.count; index++) {
        PanoramMenuItem *item = self.views[index];
        item.frame = CGRectMake(index * (width + 10) + 5,
                                0,
                                width,
                                self.scroll.frame.size.height);
    }
}

#pragma mark - IBAction
- (IBAction)expenAction:(id)sender {
    self.selectBtn.selected = !self.selectBtn.selected;
    
    if (self.expanHander) {
        self.expanHander(self, self.selectBtn.selected);
    }
}

@end

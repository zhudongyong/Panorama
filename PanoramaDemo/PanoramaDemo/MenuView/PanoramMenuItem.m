//
//  PanoramMenuItem.m
//  TestPanarom
//
//  Created by dongyongzhu on 16/1/24.
//  Copyright © 2016年 innovator. All rights reserved.
//

#import "PanoramMenuItem.h"

@interface PanoramMenuItem ()
@property (nonatomic, strong) IBOutlet UILabel      *titleLbl;
@property (nonatomic, strong) IBOutlet UIImageView  *imageIV;

@end

@implementation PanoramMenuItem

+ (PanoramMenuItem*)item {
    return [[[NSBundle mainBundle] loadNibNamed:@"PanoramMenuItem" owner:nil options:nil] lastObject];
}

#pragma mark - Setter
- (void)setItem:(NSDictionary *)item {
    _item = item;
    
    self.imageIV.image = [UIImage imageNamed:_item[@"ImageName"]];
    self.titleLbl.text = _item[@"Title"];
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = _selected?2:0;
}

#pragma mark - IBAction
- (IBAction)selectAction:(id)sender {
    if (self.hander) {
        self.hander(self);
    }
}

@end

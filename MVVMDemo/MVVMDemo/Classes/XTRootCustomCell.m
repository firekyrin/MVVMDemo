//
//  XTRootCustomCell.m
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import "XTRootCustomCell.h"

@implementation XTRootCustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (UINib *)nibWithIdentifier:(NSString *)identifier {
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - Public
+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier {
    [table registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}

#pragma mark - Rewrite these func in SubClass!
- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indextPath {
    //Rewrite this func in SubClass!
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj indextPath:(NSIndexPath *)indexPath {
    //Rewrite this func in SubClass if necessary
    if (!obj) {
        return 0.0f;
    }
    
    return 44.0f; //default cell height
}



@end

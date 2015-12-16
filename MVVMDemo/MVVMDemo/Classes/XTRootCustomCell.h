//
//  XTRootCustomCell.h
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import <UIKit/UIKit.h>

//所有cell类需要继承该类
@interface XTRootCustomCell : UITableViewCell

+ (void)registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier;

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indextPath;

+ (CGFloat)getCellHeightWithCustomObj:(id)obj indextPath:(NSIndexPath *)indexPath;

@end

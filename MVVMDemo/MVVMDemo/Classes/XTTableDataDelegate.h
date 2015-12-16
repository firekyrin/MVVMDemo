//
//  XTTableDataDelegate.h
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XTRootCustomCell;

typedef void(^TableViewCellConfigureBlock)(NSIndexPath *indexPath, id item, XTRootCustomCell *cell);

typedef CGFloat(^CellHeightBlock)(NSIndexPath *indexPath, id item);

typedef void(^DidSelectCellBlock)(NSIndexPath *indexPath, id item);


//这个类，就是传说中的ViewModel，所有的业务逻辑都放到这个类处理。
@interface XTTableDataDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock cellHeightBlock:(CellHeightBlock)aHeightBlock didSelectBlock:(DidSelectCellBlock)didSelectBlock;

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)table;

- (void)updateDataSource:(UITableView *)table items:(NSArray *)items;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

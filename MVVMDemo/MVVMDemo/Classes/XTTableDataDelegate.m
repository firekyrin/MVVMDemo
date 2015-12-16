//
//  XTTableDataDelegate.m
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import "XTTableDataDelegate.h"
#import "XTRootCustomCell.h"

@interface XTTableDataDelegate ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) CellHeightBlock heightConfigureBlock;
@property (nonatomic, copy) DidSelectCellBlock didSelectCellBlock;

@end

@implementation XTTableDataDelegate

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock cellHeightBlock:(CellHeightBlock)aHeightBlock didSelectBlock:(DidSelectCellBlock)didSelectBlock {
    self = [super init];
    
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = aConfigureCellBlock;
        self.heightConfigureBlock = aHeightBlock;
        self.didSelectCellBlock = didSelectBlock;
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(int)indexPath.row];
}

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)table {
    table.dataSource = self;
    table.delegate = self;
}

- (void)updateDataSource:(UITableView *)table items:(NSArray *)items {
    self.items = items;
    
    [table reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    XTRootCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        [XTRootCustomCell registerTable:tableView nibIdentifier:self.cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    self.configureCellBlock(indexPath, item, cell);
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    
    return self.heightConfigureBlock(indexPath, item);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    
    self.didSelectCellBlock(indexPath, item);
}

@end

//
//  XTCustomViewController.m
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import "XTCustomViewController.h"
#import "XTChildCustomCell.h"
#import "XTTableDataDelegate.h"
#import "MyObj.h"

@interface XTCustomViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic, strong) XTTableDataDelegate *tableHander;

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation XTCustomViewController

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
        
        for (int i = 0; i < 10; i++) {
            MyObj *obj = [[MyObj alloc] init];
            obj.name = [NSString stringWithFormat:@"Your name is : %d", i];
            obj.height = 50 + i * 5;
            [_list addObject:obj];
        }
    }
    
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView {
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    TableViewCellConfigureBlock configureBlock = ^(NSIndexPath *indexPath, MyObj *obj, XTRootCustomCell *cell) {
        [cell configure:cell customObj:obj indexPath:indexPath];
    };
    
    CellHeightBlock heightBlock = ^CGFloat(NSIndexPath *indexPath, id item) {
        return [XTChildCustomCell getCellHeightWithCustomObj:item indextPath:indexPath];
    };
    
    DidSelectCellBlock selectedBlock = ^(NSIndexPath *indexPath, id item) {
        NSLog(@"click row: %@", @(indexPath.row));
    };
    
    NSString *MyCellIdentifier = @"XTChildCustomCell";
    
    self.tableHander = [[XTTableDataDelegate alloc] initWithItems:self.list cellIdentifier:MyCellIdentifier configureCellBlock:configureBlock cellHeightBlock:heightBlock didSelectBlock:selectedBlock];
    
    [self.tableHander handleTableViewDataSourceAndDelegate:self.table];
}

- (void)refreshData {
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(addSomeData:) userInfo:nil repeats:NO];
}

- (void)addSomeData:(NSTimer *)timer {
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    
    MyObj *obj1 = [[MyObj alloc] init];
    obj1.name = @"Jim";
    obj1.height = 50;
    [self.list addObject:obj1];
    
    MyObj *obj2 = [[MyObj alloc] init];
    obj2.name = @"Kit";
    obj2.height = 60;
    [self.list addObject:obj2];
    
    MyObj *obj3 = [[MyObj alloc] init];
    obj3.name = @"firekyrin";
    obj3.height = 56;
    [self.list addObject:obj3];
    
    MyObj *obj4 = [[MyObj alloc] init];
    obj4.name = @"Tom Sun";
    obj4.height = 93;
    [self.list addObject:obj4];
    
    MyObj *obj5 = [[MyObj alloc] init];
    obj5.name = @"Jakinn Wang";
    obj5.height = 78;
    [self.list addObject:obj5];
    
    [self.tableHander updateDataSource:self.table items:self.list];
}

@end

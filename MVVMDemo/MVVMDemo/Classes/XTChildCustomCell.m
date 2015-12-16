//
//  XTChildCustomCell.m
//  MVVMDemo
//
//  Created by haizitong3 on 15/12/15.
//  Copyright © 2015年 FireKyrin. All rights reserved.
//

#import "XTChildCustomCell.h"
#import "MyObj.h"

@interface XTChildCustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbHeight;


@end

@implementation XTChildCustomCell

- (void)awakeFromNib {
    //
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //
}

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indextPath {
    MyObj *myObj = (MyObj *)obj;
    XTChildCustomCell *myCell = (XTChildCustomCell *)cell;
    myCell.lbTitle.text = myObj.name;
    myCell.lbHeight.text = [NSString stringWithFormat:@"my Height is: %@", @(myObj.height)];
    cell.backgroundColor = indextPath.row % 2 ? [UIColor greenColor] : [UIColor brownColor];
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj indextPath:(NSIndexPath *)indexPath {
    return ((MyObj *)obj).height;
}

@end

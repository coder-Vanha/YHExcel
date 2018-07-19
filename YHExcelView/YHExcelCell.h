//
//  YHExcelCell.h
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, YHExcelCellType) {
//    YHExcelCellTypeLeft,
//    YHExcelCellTypeRight
//};

@interface YHExcelCell : UITableViewCell

@property (nonatomic, strong) NSString *leftTitle;

@property (nonatomic, strong) NSArray *contentArr;

 //LeftTitle:(NSString *)leftTitle RightContentArr:(NSArray *)rightContentArr

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Type:(YHExcelCellType)type ColumnNum:(NSInteger)columnNum TextArr:(NSArray *)textArr;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ColumnNum:(NSInteger)columnNum;

@end

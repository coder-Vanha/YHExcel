//
//  YHExcelCell.m
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import "YHExcelCell.h"
#import "YHTextLabel.h"
#import "YHExcelConstant.h"

@interface YHExcelCell()

@property (nonatomic, strong) NSMutableArray <UILabel *> *labelArr;

@end

@implementation YHExcelCell



- (NSMutableArray<UILabel *> *)labelArr {
    if (!_labelArr) {
        _labelArr = [NSMutableArray array];
    }
    return _labelArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ColumnNum:(NSInteger)columnNum {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadCellLabelWithColumnNum:columnNum];
    }
    return self;
}

- (void)loadCellLabelWithColumnNum:(NSInteger)columnNum{
    
    self.contentView.backgroundColor = [UIColor blackColor];
    
    for (int i = 0; i < columnNum; i++) {
        
        YHTextLabel *textLabel=[[YHTextLabel alloc]initWithFrame:CGRectMake(i * (mWidth + 0.5), 0, mWidth - 0.5, cellHeight - 1)];
        
        //         headView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        textLabel.backgroundColor = [UIColor whiteColor];
       // textLabel.text = textArr[i];
        
      //  textLabel.text = [NSString stringWithFormat:@"%d",i];
        
        
        [self.contentView addSubview:textLabel];
        
        [self.labelArr addObject:textLabel];
        
    }
    
}

- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    UILabel *textLb = self.labelArr.firstObject;
    textLb.text = leftTitle;
    
}

- (void)setContentArr:(NSArray *)contentArr {
    _contentArr = contentArr;
    for (int i = 0; i < contentArr.count; i++) {
         UILabel *textLb = self.labelArr[i];
        textLb.text = contentArr[i];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

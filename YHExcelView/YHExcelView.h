//
//  YHExcelView.h
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHExcelView;
@protocol YHExcelViewDelegate <NSObject>
- (void)excelViewDidSelectItemAtindexPath:(NSIndexPath *)indexpath;
@end

@interface YHExcelView : UIView

//- (instancetype)initWithFrame:(CGRect)frame X_TitleArray:(NSArray *)x_titleArray Y_TitleArray:(NSArray *)y_titleArray;

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray DicArray:(NSArray *)dicArray KeyArray:(NSArray *)keyArray FirstTitle:(NSString *)firstTitle SecondTitle:(NSString *)secondTitle;

@property (nonatomic, weak) id <YHExcelViewDelegate> delegate;

@end

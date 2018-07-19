//
//  YHExcelView.m
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import "YHExcelView.h"
#import "YHExcelConstant.h"
#import "YHExcelHeaderLeftView.h"
#import "YHTextLabel.h"
#import "YHExcelCell.h"
#import "Common.h"

@interface YHExcelView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *headerRightView;

@property (nonatomic, strong) UITableView *leftTabView;

@property (nonatomic, strong) UITableView *rightTabView;

@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) NSArray *dicArr;

@property (nonatomic, strong) NSArray *keyArr;
@end

@implementation YHExcelView

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray DicArray:(NSArray *)dicArray KeyArray:(NSArray *)keyArray FirstTitle:(NSString *)firstTitle SecondTitle:(NSString *)secondTitle{
     if (self = [super initWithFrame:frame]) {
         [self loadExcelHeaderViewWithTitleArray:titleArray DicArray:dicArray KeyArray:keyArray FirstTitle:firstTitle SecondTitle:secondTitle];
         self.titleArr = titleArray;
         self.dicArr = dicArray;
         self.keyArr = keyArray;
     }
    
    return self;
}

- (void)loadExcelHeaderViewWithTitleArray:(NSArray *)titleArray DicArray:(NSArray *)dicArray KeyArray:(NSArray *)keyArray FirstTitle:(NSString *)firstTitle SecondTitle:(NSString *)secondTitle{
    [self layoutIfNeeded];
    // 表头说明
    YHExcelHeaderLeftView *headerLeftView = [[YHExcelHeaderLeftView alloc] initWithFrame:CGRectMake(0, 0, leftWidth, mHeight) FirstTitle:firstTitle SecondTitle:secondTitle] ;
    headerLeftView.backgroundColor = [UIColor whiteColor];
    headerLeftView.layer.borderColor = [UIColor blackColor].CGColor;
    headerLeftView.layer.borderWidth = 1;
    [self addSubview:headerLeftView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(leftWidth, 0, ScreenWidth - leftWidth, CGRectGetHeight(self.frame))];
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(mWidth * titleArray.count, 0);
    scrollView.backgroundColor = [UIColor yellowColor];
    [self addSubview:scrollView];
    
    // 顶部_表头
    self.headerRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mWidth * titleArray.count , mHeight)];
    self.headerRightView.backgroundColor = [UIColor blackColor];
    for(int i = 0; i < titleArray.count; i++){
        YHTextLabel *textLabel=[[YHTextLabel alloc]initWithFrame:CGRectMake(i * (mWidth + 0.5), 1, mWidth - 0.5, mHeight - 2)];
        textLabel.backgroundColor = RGBA(229, 239, 255, 1);
#warning mark -- 优化下面数组，防止为nil
        textLabel.text = titleArray[i];
        textLabel.textColor = RGBA(85, 165, 224, 1);
        [self.headerRightView addSubview:textLabel];
    }
    [scrollView addSubview:self.headerRightView];
    
    // 左边_表头
    self.leftTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, mHeight, mWidth, CGRectGetHeight(self.frame)-mHeight)];
    self.leftTabView.bounces = NO;
    self.leftTabView.backgroundColor = [UIColor blueColor];
    self.leftTabView.delegate = self;
    self.leftTabView.dataSource = self;
    self.leftTabView.tag = 0;
    [self addSubview:self.leftTabView];
    
    // 内容
    self.rightTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, mHeight, mWidth * titleArray.count, CGRectGetHeight(self.frame)-mHeight)];
    self.rightTabView.bounces = NO;
    self.rightTabView.backgroundColor = [UIColor redColor];
    self.rightTabView.delegate = self;
    self.rightTabView.dataSource = self;
    self.rightTabView.tag = 1;
    [scrollView addSubview:self.rightTabView];
}

#pragma mark -- tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dicArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YHExcelCell *cell;
    static NSString *ID;
    if (tableView.tag == 0) {
        ID = @"ExcelLeftCell";
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[YHExcelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ColumnNum:1];
        }
        // 再完善
        NSString *key = self.keyArr[0];
        NSDictionary *dic = self.dicArr[indexPath.row];
        NSString *valueStr ;
        if ([[dic allKeys]containsObject:key]) {
            valueStr = [dic objectForKey:key];
        }else{
            valueStr = @"";
        }
        cell.leftTitle = valueStr;
        
    }else {
        ID = @"ExcelRightCell";
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[YHExcelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ColumnNum:self.titleArr.count];
        }
        NSMutableArray *mutArr = [NSMutableArray array];
        NSDictionary *dic = self.dicArr[indexPath.row];
        for (int i = 1; i < self.titleArr.count+1; i++) {
            NSString *key = self.keyArr[i];
#warning mark -- 在完善（如果该字典中不存在Key） 下面这种情况会蹦
//            2018-03-06 10:06:50.709019+0800 HXContract[1442:153035] 字典：{
//                "bezhiju" : "0.36",
//                "title" : "宽带发展量用(户)",
//                "fengongsi" : "0.29",
//                "quanshi" : "0.55"
//            }
//            2018-03-06 10:06:50.709156+0800 HXContract[1442:153035] KEY: ZF_ZW
            NSLog(@"字典：%@",dic);
            NSLog(@"KEY: %@",key);
            
            NSString *valueStr ;
            if ([[dic allKeys]containsObject:key]) {
                valueStr = [dic objectForKey:key];
            }else{
                valueStr = @"";
            }
            [mutArr addObject:valueStr];
        }
        cell.contentArr = mutArr;
    }
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  //  cell.subtypeView.text = self.leftArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTabView) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(excelViewDidSelectItemAtindexPath:)]) {
            [self.delegate excelViewDidSelectItemAtindexPath:indexPath];
        }
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY;
    CGPoint timeOffsetY;
    if(scrollView.tag == 0){
        offsetY = self.leftTabView.contentOffset.y;
        timeOffsetY = self.rightTabView.contentOffset;
        timeOffsetY.y = offsetY;
        self.rightTabView.contentOffset = timeOffsetY;
        if(offsetY == 0) {
            self.rightTabView.contentOffset=CGPointZero;
        }
    }else if(scrollView.tag == 1){
        offsetY = self.rightTabView.contentOffset.y;
        timeOffsetY = self.leftTabView.contentOffset;
        timeOffsetY.y = offsetY;
        self.leftTabView.contentOffset = timeOffsetY;
        if(offsetY == 0) {
            self.leftTabView.contentOffset=CGPointZero;
        }
    }else {
        NSLog(@"nothing to do!");
    }
    NSLog(@"😄😄%ld",scrollView.tag);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

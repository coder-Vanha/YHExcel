//
//  YHExcelHeaderLeftView.m
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import "YHExcelHeaderLeftView.h"
#import "YHExcelConstant.h"

@interface YHExcelHeaderLeftView ()
@property (nonatomic, strong) NSString *firstTitle;
@property (nonatomic, strong) NSString *secondTitle;
@end

@implementation YHExcelHeaderLeftView

- (instancetype)initWithFrame:(CGRect)frame FirstTitle:(NSString *)firstTitle SecondTitle:(NSString *)secondTitle {
    if (self = [super initWithFrame:frame]) {
        self.firstTitle = firstTitle;
        self.secondTitle = secondTitle;
    }
     return self;
}

- (void)drawRect:(CGRect)rect {
    
    CAShapeLayer *solidShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef solidShapePath =  CGPathCreateMutable();
    [solidShapeLayer setFillColor:[[UIColor redColor] CGColor]];
    [solidShapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    solidShapeLayer.lineWidth = 1.0f ;
    CGPathMoveToPoint(solidShapePath, NULL, 0, 0);
    CGPathAddLineToPoint(solidShapePath, NULL, leftWidth,mHeight);
    [solidShapeLayer setPath:solidShapePath];
    CGPathRelease(solidShapePath);
    [self.layer addSublayer:solidShapeLayer];
    
    [_firstTitle drawInRect:CGRectMake(leftWidth/2,  15, leftWidth/2, 15) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    [_secondTitle drawInRect:CGRectMake(20,  mHeight/2+5, leftWidth/2, 15) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    
}

@end

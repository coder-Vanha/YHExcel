//
//  YHTextLabel.m
//  HXContract
//
//  Created by wanyehua on 2018/2/28.
//  Copyright © 2018年 BONC. All rights reserved.
//

#import "YHTextLabel.h"

@implementation YHTextLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.numberOfLines = 0;
        
        self.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return self;
}

@end

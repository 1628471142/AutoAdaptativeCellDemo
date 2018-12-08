//
//  TestModel.m
//  AutoAdaptativeCellDemo
//
//  Created by 1 on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

+ (TestModel *)creatTestModel{
    
    TestModel * model = [[self alloc] init];
    
    model.title = @"我是标题";
    
    NSString * content = @"我是内容，看看我有没有自适应啊。";
    NSInteger repeatTimes = arc4random()%3;
    for (int i = 0; i < repeatTimes; i ++) {
        content = [content stringByAppendingString:content];
    }
    model.content = content;
    model.headImageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544266672272&di=884b4a53c028d012cf6858062a3ae55a&imgtype=0&src=http%3A%2F%2Fp0.so.qhmsg.com%2Ft011672ecebf4741ccf.jpg";
    
    return model;
    
}
@end

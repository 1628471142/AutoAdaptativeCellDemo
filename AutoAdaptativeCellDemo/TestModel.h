//
//  TestModel.h
//  AutoAdaptativeCellDemo
//
//  Created by 1 on 2018/12/8.
//  Copyright © 2018 weiyian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * headImageUrl;

+ (TestModel *)creatTestModel;

@end

NS_ASSUME_NONNULL_END

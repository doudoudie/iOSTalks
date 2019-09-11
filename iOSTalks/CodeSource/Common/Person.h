//
//  Person.h
//  iOSTalks
//
//  Created by 登登 on 2019/8/28.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END

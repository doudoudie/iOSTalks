//
//  Person.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/28.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if(self) {
        _name = name;
        _age = age;
    }
    
    return self;
}

@end

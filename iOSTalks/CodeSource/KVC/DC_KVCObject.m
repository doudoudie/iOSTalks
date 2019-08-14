//
//  DC_KVCObject.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "DC_KVCObject.h"

@interface DC_KVCObject ()
{
    NSString *_dept;
//    NSString *_isDept;
//    NSString *dept;
//    NSString *isDept;
    NSString *isSex;
}

//@property (nonatomic,strong) NSString *dept;

@end

@implementation DC_KVCObject

- (instancetype)initDC_KVCObjectWith:(NSString *)name title:(NSString *)title
{
    self = [super init];
    if (self) {
        _name = name;
        _title = title;
    }
    
    return self;
}

+ (BOOL)accessInstanceVariablesDirectly {
    // Make sure KVC doesn't use instance variables.
    return YES;
}

//- (void)setDept:(NSString *)dept {
//    _dept = dept;
//    NSLog(@"setDept被调用");
//}

//- (void)_setDept:(NSString *)dept {
//     _dept = dept;
//     NSLog(@"_setDept被调用");
//}

- (void)willChangeValueForKey:(NSString *)key{
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey:%@",key);
}

- (void)didChangeValueForKey:(NSString *)key{
    NSLog(@"didChangeValueForKey:%@ -----begin",key);
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey:%@ -----end",key);
}

@end

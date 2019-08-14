//
//  DC_KVOObject.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "DC_KVOObject.h"
#import <objc/runtime.h>

@interface DC_KVOObject ()
@property (nonatomic,assign) NSInteger age;
@end

@implementation DC_KVOObject

- (void)printObjctInfo:(NSString *)pre_info{
    NSLog(@"%@:isa %@ - supper class %@",pre_info,NSStringFromClass(object_getClass(self)),class_getSuperclass(object_getClass(self)));
}

// 重写set方法手动调用KVO
- (void)setName:(NSString *)name {
    if(![name isEqualToString:_name]){
        [self willChangeValueForKey:@"name"];
        _name = name;
        [self didChangeValueForKey:@"name"];
    }
}


// 重写automaticallyNotifiesObserversForKey方法判断是否放弃对key的自动KVO监听
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    BOOL automatic = NO;
    if ([key isEqualToString:@"keyPath"]) {
        automatic = NO;
    }else {
        automatic = [super automaticallyNotifiesObserversForKey:key];
    }
    return automatic;
}

@end

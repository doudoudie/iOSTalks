//
//  DC_KVOObject.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "DC_KVOObject.h"
#import <objc/runtime.h>

@implementation DC_KVOObject

- (void)printObjctInfo:(NSString *)pre_info{
    NSLog(@"%@:isa %@ - supper class %@",pre_info,NSStringFromClass(object_getClass(self)),class_getSuperclass(object_getClass(self)));
}

//- (void)setName:(NSString *)newName {
//    [self willChangeValueForKey:@"name"];
//    [super setValue:newName forKey:@"name"];
//    [self didChangeValueForKey:@"name"];
//}

@end

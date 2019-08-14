//
//  DC_KVCObject.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "DC_KVCObject.h"

@interface DC_KVCObject ()
@property (nonatomic,strong) NSString *dept;
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

@end

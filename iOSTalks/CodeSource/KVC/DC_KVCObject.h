//
//  DC_KVCObject.h
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DC_KVCObject : NSObject

- (instancetype)initDC_KVCObjectWith:(NSString *)name title:(NSString *)title;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong,readonly) NSString *title;

@end

NS_ASSUME_NONNULL_END

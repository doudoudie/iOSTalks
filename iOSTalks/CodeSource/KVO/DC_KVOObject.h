//
//  DC_KVOObject.h
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DC_KVOObject : NSObject

@property (nonatomic,strong) NSString *name;

- (void)printObjctInfo:(NSString *)pre_info;



@end

NS_ASSUME_NONNULL_END

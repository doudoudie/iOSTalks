//
//  Book.h
//  iOSTalks
//
//  Created by 登登 on 2019/8/28.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

- (void)addChaptersObject:(NSString *)object;

-(id)objectInChaptersAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

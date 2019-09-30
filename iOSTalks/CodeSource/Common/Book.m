//
//  Book.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/28.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "Book.h"

@interface Book ()
@property (nonatomic,copy) NSString *bookId;
@property (nonatomic,copy) NSString *bookName;
@property (nonatomic,assign,readonly) BOOL isNew;
@property (nonatomic,assign) CGSize cgSize;

@property (nonatomic,strong) Author *author;

@property (nonatomic,strong) NSMutableArray<NSString *> *chapters;

@property (nonatomic,strong) NSDictionary *dict;

@end

@implementation Book

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if([key isEqualToString:@"author"]){
        if(_author) {
            [_author setValuesForKeysWithDictionary:value];
        }else {
            _author = [[Author alloc] init];
            [_author setValuesForKeysWithDictionary:value];
        }
    }else {
        [super setValue:value forKey:key];
    }
    
    if([key isEqualToString:@"id"]){
        key = @"bookId";
        [super setValue:value forKey:key];
    }
    
}

// 异常错误处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForKey:(NSString *)key {
    if([key isEqualToString:@"author"]) {
        return @{@"name":_author.name};
    }
    return [super valueForKey:key];
}

- (NSString *)getBookName {
    return _bookName;
}

// 异常错误处理
//- (id)valueForUndefinedKey:(NSString *)key {
//    return nil;
//}

-(id)objectInChaptersAtIndex:(NSUInteger)index {
    return [self.chapters objectAtIndex:index];
}

-(NSUInteger)countOfChapters {
    return self.chapters.count;
}

- (void)addChaptersObject:(NSString *)object {
    [[self mutableArrayValueForKey:@"chapters"] addObject:object];
}

@end

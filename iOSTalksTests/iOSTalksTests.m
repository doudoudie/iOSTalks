//
//  iOSTalksTests.m
//  iOSTalksTests
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DC_KVOObject.h"

@interface iOSTalksTests : XCTestCase

@end

@implementation iOSTalksTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testKVOExample {
    // This is an example of a functional test case.
    DC_KVOObject *dcObject = [[DC_KVOObject alloc] init];
    dcObject.name = @"登登";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听前"];
    [dcObject addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    dcObject.name = @"登登";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听后"];
    
    [dcObject removeObserver:self forKeyPath:@"value"];
    //打印isa和superclass
    [dcObject printObjctInfo:@"监听移除后"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"value"]) {
        NSLog(@"value is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }
}

@end

//
//  iOSTalksTests.m
//  iOSTalksTests
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DC_KVOObject.h"
#import "DC_KVCObject.h"

@interface iOSTalksTests : XCTestCase
@property (nonatomic,strong) DC_KVCObject *dcObject;
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

- (void)testKVCExample {
    // This is an example of a functional test case.
    DC_KVCObject *dcObject = [[DC_KVCObject alloc] initDC_KVCObjectWith:@"登登" title:@"iOS 开发"];
    // 属性值的存取
    //[dcObject setValue:@"iOS开发Leader" forKey:@"title"];
    //NSString *title = [dcObject valueForKey:@"title"];
    //NSLog(@"%@",title);
    //私有熟悉的存取
    
    //[dcObject addObserver:self forKeyPath:@"dept" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    [dcObject setValuesForKeysWithDictionary:@{@"dept":@"开发",@"title":@"也是开发"}];
    
    [dcObject setValue:@"开发部" forKey:@"dept"]; // 我们在通过KVC在给成员变量赋值的时候 会触发willChangeValueForKey:,willChangeValueForKey: 所以也会触发KVO
    NSString *dept = [dcObject valueForKey:@"dept"];
    NSLog(@"%@",dept);
    
    NSDictionary *dict = [dcObject dictionaryWithValuesForKeys:@[@"title",@"dept"]];
    NSLog(@"%@",dict);
}

- (void)testKVCForKeyPathExample {
    // This is an example of a functional test case.
    self.dcObject = [[DC_KVCObject alloc] initDC_KVCObjectWith:@"登登" title:@"iOS 开发"];
    // 属性值的存取
    [self.dcObject setValue:@"iOS开发Leader_" forKeyPath:@"title"];
    NSLog(@"属性值：%@",self.dcObject.title);
    NSString *title_ = [self.dcObject valueForKeyPath:@"title"];
    NSLog(@"valueForKeyPath:%@",title_);
    
    [self setValue:@"iOS开发Leader" forKeyPath:@"dcObject.title"];
    NSLog(@"属性值：%@",self.dcObject.title);
    NSString *title = [self valueForKeyPath:@"dcObject.title"];
    NSLog(@"valueForKeyPath:%@",title);
    //私有熟悉的存取
    [self setValue:@"开发部" forKeyPath:@"dcObject.dept"];
    NSString *dept = [self valueForKeyPath:@"dcObject.dept"];
    NSLog(@"%@",dept);
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"value"]) {
        NSLog(@"value is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }if ([keyPath isEqualToString:@"dept"]) {
        NSLog(@"dept is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }
}

@end

//
//  ViewController.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "ViewController.h"
#import "DC_KVOObject.h"
#import "Person.h"

#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self testKVO];
    
    [self testKVC];
}

- (void)testKVO {
    
    DC_KVOObject *dcObject = [[DC_KVOObject alloc] init];
    
    // 原理系列
    /*dcObject.name = @"登登";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听前"];
    [dcObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    dcObject.name = @"登登2";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听后"];
    [dcObject removeObserver:self forKeyPath:@"name"];
    //打印isa和superclass
    [dcObject printObjctInfo:@"监听移除后"];*/
    
    // 进阶系列
    [dcObject addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    [dcObject setValue:@(10) forKey:@"age"];
    
}

- (void)testKVC {
    
    Person *p1 = [[Person alloc] initWithName:@"登登2号" age:10];
    Person *p2 = [[Person alloc] initWithName:@"登登1号" age:15];
    Person *p3 = [[Person alloc] initWithName:@"登登5号" age:20];
    Person *p4 = [[Person alloc] initWithName:@"登登2号" age:30];
    Person *p5 = [[Person alloc] initWithName:@"登登3号" age:50];
    
    NSArray *tmpAry = @[p1,p2,p3,p4,p5];
    
    // 简单集合运算符
    NSInteger avg = [[tmpAry valueForKeyPath:@"@avg.age"] integerValue];
    NSLog(@"avg - %ld",avg);
    NSInteger sum = [[tmpAry valueForKeyPath:@"@sum.age"] integerValue];
    NSLog(@"sum - %ld",sum);
    NSInteger max = [[tmpAry valueForKeyPath:@"@max.age"] integerValue];
    NSLog(@"max - %ld",max);
    NSInteger min = [[tmpAry valueForKeyPath:@"@min.age"] integerValue];
    NSLog(@"min - %ld",min);
    
    // count：取数组中元素的个数，下面 3 种写法等价
    NSInteger count = [[tmpAry valueForKeyPath:@"@count.age"] integerValue];
    NSLog(@"count.age %ld",count);
    NSInteger count1 = [[tmpAry valueForKeyPath:@"@count"] integerValue];
    NSLog(@"count %ld",count1);
    //NSInteger count2 = perArray.count;
    
    NSArray<NSString *> *nameArray = [tmpAry valueForKeyPath:@"@unionOfObjects.name"];
    NSLog(@"unionOfObjects.name %@",nameArray);
    NSArray<NSString *> *nameArray2 = [tmpAry valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"distinctUnionOfObjects.name %@",nameArray2);
    
    Person *p_1 = [[Person alloc] initWithName:@"DD2号" age:18];
    Person *p_2 = [[Person alloc] initWithName:@"DD1号" age:28];
    Person *p_3 = [[Person alloc] initWithName:@"DD5号" age:38];
    Person *p_4 = [[Person alloc] initWithName:@"DD2号" age:58];
    Person *p_5 = [[Person alloc] initWithName:@"DD3号" age:68];
    
    NSArray *tmpAry2 = @[p_1,p_2,p_3,p_4,p_5];
    
    NSArray *ary_1 = [@[tmpAry,tmpAry2] valueForKeyPath:@"@unionOfArrays.name"];
    NSLog(@"unionOfArrays.name %@",ary_1);
    NSArray *ary_2 = [@[tmpAry,tmpAry2] valueForKeyPath:@"@distinctUnionOfArrays.name"];
    NSLog(@"distinctUnionOfArrays.name %@",ary_2);
    
    NSDictionary *dictionary = @{@"bookId":@"1001",@"bookIds":@"1001",@"bookName":@"iOSBook",@"author":@{@"name":@"dengdeng"},@"chapters":@[@"一",@"二"]};
    Book *book = [[Book alloc] init];
    [book setValuesForKeysWithDictionary:dictionary];
    
    [[book mutableArrayValueForKey:@"chapters"] addObject:@"三"];
    
    NSLog(@"%@",[book mutableArrayValueForKey:@"chapters"]);
    
    //[book valueForKey:NSStringFromSelector(@selector(getBookName))];
    [book valueForKey:@"bookName"];
    
    [book addChaptersObject:@"五"];
    NSLog(@"%@",[book objectInChaptersAtIndex:0]);
    
    NSLog(@"编号：%@, 书名：%@ ,作者：%@",[book valueForKey:@"bookId"],[book valueForKey:@"bookName"],[book valueForKeyPath:@"author.name"]);
    [book setValue:@"PythonBook" forKey:@"bookName"];
    
    [book setValue:@(1) forKey:@"isNew"];
    
    NSDictionary *dict = [book dictionaryWithValuesForKeys:@[@"bookId",@"bookName",@"author"]];
    NSLog(@"dictionaryWithValuesForKeys: %@",dict);
    
    NSError *error;
    NSString *name = @"登登";
    if([book validateValue:&name forKey:@"bookNamekk" error:&error])
    {
        NSLog(@"%@", error);
    }
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"name is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }else if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"age is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }
    
}




@end

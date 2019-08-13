//
//  ViewController.m
//  iOSTalks
//
//  Created by 登登 on 2019/8/13.
//  Copyright © 2019 黄登登. All rights reserved.
//

#import "ViewController.h"
#import "DC_KVOObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DC_KVOObject *dcObject = [[DC_KVOObject alloc] init];
    dcObject.name = @"登登";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听前"];
    [dcObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    dcObject.name = @"登登";
    //打印isa和superclass
    [dcObject printObjctInfo:@"添加监听后"];
    
    [dcObject removeObserver:self forKeyPath:@"name"];
    //打印isa和superclass
    [dcObject printObjctInfo:@"监听移除后"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"value is changed! new = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    }
    
}


@end
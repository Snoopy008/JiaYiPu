//
//  ViewController.m
//  JiaYiPu
//
//  Created by 葛承铭 on 2019/5/5.
//  Copyright © 2019 JiaYiPu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        //允许侧滑返回
        self.allowsBFNavigationGesture = YES;
        //进度条颜色
        self.showProgressView = YES;
        self.progressTintColor = [UIColor greenColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




@end

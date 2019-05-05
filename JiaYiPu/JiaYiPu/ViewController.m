//
//  ViewController.m
//  JiaYiPu
//
//  Created by 葛承铭 on 2019/5/5.
//  Copyright © 2019 JiaYiPu. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *refreshBtn;

@end


@implementation ViewController

- (UIButton *)refreshBtn
{
    if (!_refreshBtn) {
        _refreshBtn = [[UIButton alloc] init];
        [_refreshBtn setImage:[UIImage imageNamed:@"icon_refresh_circle"] forState:UIControlStateNormal];
        [_refreshBtn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refreshBtn;
}

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
    self.refreshBtn.hidden = YES;
    [self.view addSubview:self.refreshBtn];
    [self.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
    // Do any additional setup after loading the view.
}

- (void)didFailLoadWithError:(NSError *)error
{
    self.refreshBtn.hidden = NO;
}

- (void)refresh
{
    self.refreshBtn.hidden = YES;
    [self.webView reload];
    
}






@end

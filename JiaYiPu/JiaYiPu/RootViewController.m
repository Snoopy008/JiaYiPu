//
//  RootViewController.m
//  JiaYiPu
//
//  Created by 葛承铭 on 2019/5/6.
//  Copyright © 2019 JiaYiPu. All rights reserved.
//

#import "RootViewController.h"
#import <Masonry.h>

@interface RootViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIButton *refreshBtn;

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation RootViewController

- (UIButton *)refreshBtn
{
    if (!_refreshBtn) {
        _refreshBtn = [[UIButton alloc] init];
        [_refreshBtn setImage:[UIImage imageNamed:@"icon_refresh_circle"] forState:UIControlStateNormal];
        [_refreshBtn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refreshBtn;
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.delegate = self;
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.refreshBtn.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
    
    [self.view addSubview:self.refreshBtn];
    [self.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://app.jiayipu.com:82/TMSApp/Web/appLogin.html"]];
    [self.webView loadRequest:request];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.refreshBtn.hidden = NO;
}

- (void)refresh
{
    self.refreshBtn.hidden = YES;
    [self.webView reload];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

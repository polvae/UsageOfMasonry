//
//  SixViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/13.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "SixViewController.h"
#import "Masonry.h"

@interface SixViewController ()

@end

@implementation SixViewController



/**
 Masonry的比例使用 multipliedBy
 使用multipliedBy必须是对同一个控件本身。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *topView = [[UIView alloc]init];
    [topView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topView];
    
    UIView *topInnerView = [[UIView alloc]init];
    [topInnerView setBackgroundColor:[UIColor greenColor]];
    [topView addSubview:topInnerView];
    
    UIView *bottomView = [[UIView alloc]init];
    [bottomView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:bottomView];
    
    UIView *bottomInnerView = [[UIView alloc]init];
    [bottomInnerView setBackgroundColor:[UIColor blueColor]];
    [bottomView addSubview:bottomInnerView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(bottomView);
    }];
    
    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
        make.center.mas_equalTo(topView);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(topView);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    
    [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(bottomView);
        make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
        make.center.mas_equalTo(bottomView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

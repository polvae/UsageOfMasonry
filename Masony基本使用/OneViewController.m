//
//  ViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/12.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "OneViewController.h"
#import "Masonry.h"

@interface OneViewController ()

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(_oneView.mas_width);
    }];
    CGFloat padding = 10;
    [_twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_oneView.mas_left).offset(padding);
        make.right.equalTo(_threeView.mas_left).offset(-padding);
        make.height.mas_equalTo(150);
        make.centerY.mas_equalTo (_oneView.mas_centerY);
        make.width.equalTo(_threeView);

    }];
    [_threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_oneView.mas_right).offset(-padding);
        make.left.equalTo(_twoView.mas_right).offset(padding);
        make.height.equalTo(@150);
        make.centerY.mas_equalTo (_twoView.mas_centerY);
        make.width.equalTo(_twoView);

    }];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

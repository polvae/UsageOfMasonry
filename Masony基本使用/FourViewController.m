//
//  FourViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/12.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "FourViewController.h"
#import "Masonry.h"

@interface FourViewController ()
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGFloat scacle;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createGrowingButton];
}

- (void)createGrowingButton {
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.growingButton setTitle:@"点我放大" forState:UIControlStateNormal];
    
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    
    self.growingButton.layer.borderWidth = 3;
    
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.growingButton];
    self.scacle = 1.0;
    
    [self.growingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        
        // 初始宽、高为100，优先级最低
        make.width.height.mas_equalTo(100 * self.scacle);
        
        // 最大放大到整个view
        make.width.height.lessThanOrEqualTo(self.view);
    }];    
}

- (void)onGrowButtonTaped:(UIButton *)sender {
    self.scacle += 1.0;
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - updateViewConstraints
// 重写该方法来更新约束
- (void)updateViewConstraints {
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        // 这里写需要更新的约束，不用更新的约束将继续存在
        // 不会被取代，如：其宽高小于屏幕宽高不需要重新再约束
        make.width.height.mas_equalTo(100 * self.scacle);
    }];
    
    [super updateViewConstraints];
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

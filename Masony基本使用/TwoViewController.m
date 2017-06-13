//
//  TwoViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/12.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "TwoViewController.h"
#import "Masonry.h"

@interface TwoViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 红色View
    _redView.backgroundColor = [UIColor redColor];
    
    // 蓝色View
    self.blueView.backgroundColor = [UIColor blueColor];
    
    // 黄色View
    _yellowView.backgroundColor = [UIColor yellowColor];
    
    // ---红色View--- 添加约束
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(20);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-80);
        make.height.equalTo([NSNumber numberWithInt:50]);
    }];
    
    // ---蓝色View--- 添加约束
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_redView.mas_right).with.offset(40);
        make.bottom.width.height.mas_equalTo(_redView);
    }];
    
    // ---黄色View--- 添加约束
    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.blueView.mas_right).with.offset(40);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-20);
        make.bottom.width.height.mas_equalTo(_redView);
        
        // 优先级设置为250，最高1000（默认）
        make.left.mas_equalTo(_redView.mas_right).with.offset(20).priority(UILayoutPriorityFittingSizeLevel);
    }];

}

// 点击屏幕移除蓝色View
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.blueView removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
//        [self.view dis];
//    [self.view updateConstraintsIfNeeded];

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

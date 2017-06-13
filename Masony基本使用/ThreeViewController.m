//
//  ThreeViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/12.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "ThreeViewController.h"
#import "Masonry.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int padding = 50;
    
    UIView *greenView = [[UIView alloc]init];
    [self.view addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    
    // 对 绿色View 进行约束
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(padding); // X
        
        make.top.mas_equalTo(self.view.mas_top).with.offset(padding); // Y
        make.bottom.mas_equalTo(blueView.mas_top).with.offset(-padding);// Y --> 推断出 Height
        
        make.width.mas_equalTo(redView); // Width == 红色View（它推断出Width）
    }];
    
    // 对 红色View 进行约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(greenView.mas_right).with.offset(padding); // X
        make.right.mas_equalTo(self.view.mas_right).with.offset(-padding);// X --> 推断出 Width
        
        make.bottom.and.height.mas_equalTo(greenView); // Y & Height == 绿色View（它推断出 Height&Y）
    }];
    
    // 对 蓝色View 进行约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(padding); // X
        make.right.mas_equalTo(self.view.mas_right).with.offset(-padding); // X --> 推断出 Width
        
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-padding); // Y
        
        make.height.mas_equalTo(greenView); // 注意1：Height == 绿色View（它推断出Height）
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

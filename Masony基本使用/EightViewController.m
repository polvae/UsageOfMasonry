//
//  EightViewController.m
//  Masony基本使用
//
//  Created by KingSoft on 2017/6/13.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "EightViewController.h"
#import "Masonry.h"

@interface EightViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation EightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(100);
    }];
    
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_redView);
        make.centerX.mas_equalTo(self.view);
        
    }];
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_redView);
        make.centerX.mas_equalTo(self.view);
        
    }];
    NSArray *viewArr = @[_redView, _blueView , _greenView];
    
    [viewArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:50 leadSpacing:64 tailSpacing:5];
    
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

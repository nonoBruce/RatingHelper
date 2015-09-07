//
//  ViewController.m
//  RatingHelper
//
//  Created by yanws on 15/9/7.
//  Copyright (c) 2015年 yanws. All rights reserved.
//

#import "ViewController.h"
#import "RatingHelper.h"

@interface ViewController ()<UIAlertViewDelegate>

@property(nonatomic, strong)RatingHelper *ratingHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rating:(id)sender {
    self.ratingHelper = [[RatingHelper alloc] init];
    
    
    [self.ratingHelper show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}
@end

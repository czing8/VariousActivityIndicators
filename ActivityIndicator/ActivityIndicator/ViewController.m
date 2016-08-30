//
//  ViewController.m
//  ActivityIndicator
//
//  Created by Vols on 16/4/3.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "ViewController.h"
#import "VActivityIndicator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:85/255.0f blue:101/255.0f alpha:1.0f];
    NSArray *activityTypes = @[
                               @(VActivityIndicatorAnimationTypeBallBeat),
                               @(VActivityIndicatorAnimationTypeNineDots),
                               @(VActivityIndicatorAnimationTypeCookieTerminator),
                               @(VActivityIndicatorAnimationTypeRotatingSandglass),
                               @(VActivityIndicatorAnimationTypeTripleRings),
                               @(VActivityIndicatorAnimationTypeRotatingTrigon),
                               ];
    
    for (int i = 0; i < activityTypes.count; i++) {
        VActivityIndicator *activityIndicatorView = [[VActivityIndicator alloc] initWithType:(VActivityIndicatorAnimationType)[activityTypes[i] integerValue] tintColor:[UIColor whiteColor]];
        CGFloat width = self.view.bounds.size.width / 4.0f;
        CGFloat height = self.view.bounds.size.height / 8.0f;
        
        activityIndicatorView.frame = CGRectMake(width * (i % 4), height * (int)(i / 4), width, height);
        [self.view addSubview:activityIndicatorView];
        [activityIndicatorView startAnimating];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  VActivityIndicatorAnimationProtocol.h
//  ActivityIndicator
//
//  Created by Vols on 16/4/3.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VActivityIndicatorAnimationProtocol <NSObject>

- (void)setupAnimationInLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor;

@end

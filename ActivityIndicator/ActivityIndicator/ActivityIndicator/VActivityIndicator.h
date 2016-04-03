//
//  VActivityIndicator.h
//  ActivityIndicator
//
//  Created by Vols on 16/4/3.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VActivityIndicatorAnimationType) {
    VActivityIndicatorAnimationTypeNineDots,
    VActivityIndicatorAnimationTypeCookieTerminator,
    VActivityIndicatorAnimationTypeBallBeat,
    VActivityIndicatorAnimationTypeRotatingSandglass,
    VActivityIndicatorAnimationTypeRotatingTrigon,
    VActivityIndicatorAnimationTypeTripleRings,
    
    
};

@interface VActivityIndicator : UIView

- (id)initWithType:(VActivityIndicatorAnimationType)type;
- (id)initWithType:(VActivityIndicatorAnimationType)type tintColor:(UIColor *)tintColor;
- (id)initWithType:(VActivityIndicatorAnimationType)type tintColor:(UIColor *)tintColor size:(CGFloat)size;

@property (nonatomic) VActivityIndicatorAnimationType type;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic) CGFloat size;

@property (nonatomic, readonly) BOOL animating;

- (void)startAnimating;
- (void)stopAnimating;

@end

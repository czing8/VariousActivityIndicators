//
//  VActivityIndicator.m
//  ActivityIndicator
//
//  Created by Vols on 16/4/3.
//  Copyright © 2016年 Vols. All rights reserved.
//

#import "VActivityIndicator.h"
#import "VActivityIndicatorNineDotsAnimation.h"
#import "VActivityIndicatorCookieTerminatorAnimation.h"
#import "VActivityIndicatorBallBeatAnimation.h"
#import "VActivityIndicatorRotatingSandglassAnimation.h"
#import "VActivityIndicatorRotatingTrigonAnimation.h"
#import "VActivityIndicatorTripleRingsAnimation.h"


#import "VActivityIndicatorAnimationProtocol.h"

static const CGFloat kVActivityIndicatorDefaultSize = 40.0f;

@implementation VActivityIndicator

#pragma mark -
#pragma mark Constructors

- (id)initWithType:(VActivityIndicatorAnimationType)type {
    return [self initWithType:type tintColor:[UIColor whiteColor] size:kVActivityIndicatorDefaultSize];
}

- (id)initWithType:(VActivityIndicatorAnimationType)type tintColor:(UIColor *)tintColor {
    return [self initWithType:type tintColor:tintColor size:kVActivityIndicatorDefaultSize];
}

- (id)initWithType:(VActivityIndicatorAnimationType)type tintColor:(UIColor *)tintColor size:(CGFloat)size {
    self = [super init];
    if (self) {
        _type = type;
        _size = size;
        _tintColor = tintColor;
    }
    return self;
}

#pragma mark -
#pragma mark Setters

- (void)setType:(VActivityIndicatorAnimationType)type {
    if (_type != type) {
        _type = type;
        
        [self setupAnimation];
    }
}

- (void)setSize:(CGFloat)size {
    if (_size != size) {
        _size = size;
        
        [self setupAnimation];
    }
}

- (void)setTintColor:(UIColor *)tintColor {
    if (![_tintColor isEqual:tintColor]) {
        _tintColor = tintColor;
        
        for (CALayer *sublayer in self.layer.sublayers) {
            sublayer.backgroundColor = tintColor.CGColor;
        }
    }
}


#pragma mark -
#pragma mark Methods

- (void)setupAnimation {
    self.layer.sublayers = nil;
    
    id<VActivityIndicatorAnimationProtocol> animation = [VActivityIndicator activityIndicatorAnimationForAnimationType:_type];
    
    if ([animation respondsToSelector:@selector(setupAnimationInLayer:size:tintColor:)]) {
        [animation setupAnimationInLayer:self.layer size:CGSizeMake(_size, _size) tintColor:_tintColor];
        self.layer.speed = 0.0f;
    }
}

- (void)startAnimating {
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    self.layer.speed = 1.0f;
    _animating = YES;
}

- (void)stopAnimating {
    self.layer.speed = 0.0f;
    _animating = NO;
}


#pragma mark -
#pragma mark Getters

+ (id<VActivityIndicatorAnimationProtocol>)activityIndicatorAnimationForAnimationType:(VActivityIndicatorAnimationType)type {
    switch (type) {
        case VActivityIndicatorAnimationTypeNineDots:
            return [[VActivityIndicatorNineDotsAnimation alloc] init];
        case VActivityIndicatorAnimationTypeCookieTerminator:
            return [[VActivityIndicatorCookieTerminatorAnimation alloc] init];
        case VActivityIndicatorAnimationTypeBallBeat:
            return [[VActivityIndicatorBallBeatAnimation alloc] init];
        case VActivityIndicatorAnimationTypeRotatingSandglass:
            return [[VActivityIndicatorRotatingSandglassAnimation alloc] init];
        case VActivityIndicatorAnimationTypeRotatingTrigon:
            return [[VActivityIndicatorRotatingTrigonAnimation alloc] init];
        case VActivityIndicatorAnimationTypeTripleRings:
            return [[VActivityIndicatorTripleRingsAnimation alloc] init];

        
    }
    return nil;
}

@end

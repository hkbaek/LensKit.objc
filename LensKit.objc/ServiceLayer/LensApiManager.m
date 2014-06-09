//
//  LensApiManager.m
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 9..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import "LensApiManager.h"

@interface LensApiManager ()
{
    
}

@end

@implementation LensApiManager

#pragma mark - LifeCycle

+ (instancetype)sharedInstance
{
    static LensApiManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LensApiManager alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
    }
    
    return self;
}

#pragma mark - Private Methods

@end

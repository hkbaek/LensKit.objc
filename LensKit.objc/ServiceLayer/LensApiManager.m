//
//  LensApiManager.m
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 9..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import "LensApiManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AFOnoResponseSerializer.h"
#import "Ono.h"

#import "ArticleModel.h"

static NSString * const LensBaseURLString = @"http://dna.daum.net/";

@implementation LensApiManager

#pragma mark - LifeCycle

+ (instancetype)sharedInstance
{
    static LensApiManager *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LensApiManager alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Request

- (void)getArticlesAtPageNumber:(NSInteger)pageNumber onCompleteBlock:(kLensResponseBlock)onCompleteBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFOnoResponseSerializer HTMLResponseSerializer];
    [manager GET:@"http://dna.daum.net/lens/page/1"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSArray *articles = [ArticleModel parseFromResponse:responseObject];
             if(onCompleteBlock)
             {
                 onCompleteBlock(articles, nil);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if(onCompleteBlock)
             {
                 onCompleteBlock([NSArray new], error);
             }
         }];
}

- (void)getArticlesAtUserID:(NSInteger)userID onCompleteBlock:(kLensResponseBlock)onCompleteBlock
{
}

- (void)getHottestArticles:(kLensResponseBlock)onCompleteBlock
{
}

@end

//
//  LensApiManager.h
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 9..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^kLensResponseBlock)(NSArray *article, NSError *error);

@interface LensApiManager : NSObject

+ (instancetype)sharedInstance;

- (void)getArticlesAtPageNumber:(NSInteger)pageNumber onCompleteBlock:(kLensResponseBlock)onCompleteBlock;
- (void)getArticlesAtUserID:(NSInteger)userID onCompleteBlock:(kLensResponseBlock)onCompleteBlock;
- (void)getHottestArticles:(kLensResponseBlock)onCompleteBlock;

@end

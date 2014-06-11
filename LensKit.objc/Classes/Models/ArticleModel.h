//
//  ArticleModel.h
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 11..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ono.h"

@interface ArticleModel : NSObject

@property (copy, nonatomic) NSString *urlString;
@property (copy, nonatomic) NSString *title;

+ (NSArray*)parseFromResponse:(id)response;

@end

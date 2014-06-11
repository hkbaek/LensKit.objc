//
//  ArticleModel.m
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 11..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import "NSObject+AutoDescription.h"
#import "Ono.h"

#import "ArticleModel.h"

static NSString * const ArticleXPathString = @"//*[contains(concat( \" \", \@class, \" \" ), concat( \" \", \"article\", \" \" ))]";
static NSString * const ArticleHref = @"href";
static NSString * const ArticleTitle = @"title";

@implementation ArticleModel

- (NSString*)description
{
    return [self autoDescription];
}

#pragma mark - Public Methods

+ (NSArray*)parseFromResponse:(id)response
{
    NSMutableArray *articles = [[NSMutableArray alloc] initWithCapacity:0];
    for(ONOXMLElement *element in [response XPath:ArticleXPathString])
    {
        NSLog(@"element = [%@]", element);
        
        ArticleModel *article = [[ArticleModel alloc] init];
        article.urlString = element[ArticleHref];
        article.title = element[ArticleTitle];
        [articles addObject:article];
    }
    
    return articles;
}

@end

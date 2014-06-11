//
//  ArticleListViewController.m
//  LensKit.objc
//
//  Created by Hokun Baek on 2014. 6. 9..
//  Copyright (c) 2014년 hokunbaek. All rights reserved.
//

#import "KINWebBrowserViewController.h"

#import "LensApiManager.h"

#import "ArticleListViewController.h"
#import "ArticleDetailViewController.h"

#import "ArticleModel.h"

static NSString * const ArticleListCell = @"ArticleListCell";

@interface ArticleListViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UITableView *_tableView;
}

@property (strong, nonatomic) NSArray *articles;

- (void)initnavigationBar;
- (void)initSubviews;
- (void)layoutSubviews;

- (void)getArticleList;

@end

@implementation ArticleListViewController

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
//        self.title = @"실시간 글 목록";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initnavigationBar];
    [self initSubviews];
    [self layoutSubviews];
    
    [self getArticleList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Subviews

- (void)initnavigationBar
{
    
}

- (void)initSubviews
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ArticleListCell];
    [self.view addSubview:_tableView];
}

- (void)layoutSubviews
{
    
}

#pragma mark - Private Methods

- (void)getArticleList
{
    LensApiManager *lensApiManager = [LensApiManager sharedInstance];
    [lensApiManager getArticlesAtPageNumber:1
                            onCompleteBlock:^(NSArray *article, NSError *error) {
                                if(error == nil)
                                {
                                    self.articles = article;
                                    [_tableView reloadData];
                                }
                                else
                                {
                                    
                                }
                            }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:ArticleListCell forIndexPath:indexPath];

    ArticleModel *article = _articles[indexPath.row];
    cell.textLabel.text = article.title;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KINWebBrowserViewController *webBrowser = [KINWebBrowserViewController webBrowser];
    [self.navigationController pushViewController:webBrowser animated:YES];
    
    ArticleModel *article = _articles[indexPath.row];
    [webBrowser loadURLString:article.urlString];
}

@end

//
//  ViewController.m
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import "ViewController.h"
#import "DPHomeViewController.h"
#import "DPServicesViewController.h"
#import "DPMediaViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIButton *homeButton;
    UIButton *servicesButton;
    UIButton *mediaButton;
    UIView *currentDisplayView;
    int currentIndex;
}
@property (nonatomic,strong)  UIView *topScrollView;
@property (nonatomic, strong) DPHomeViewController *dphomecontroller;
@property (nonatomic, strong) DPServicesViewController *servicesViewController;
@property (nonatomic, strong) DPMediaViewController *mediaViewController;
@property (nonatomic,strong)  UIScrollView *contentScrollView;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self loadHomeView];
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, 320, 438)];
    [self.view addSubview:_contentScrollView];
    
    _contentScrollView.delegate = self;
    [_contentScrollView setBackgroundColor:[UIColor clearColor]];
    
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.bounces = NO;

    _contentScrollView.showsHorizontalScrollIndicator = YES;
    [_contentScrollView setContentSize:CGSizeMake(320*3, 438)];
    [self performSelector:@selector(placeViewsOnScrollView) withObject:nil afterDelay:1];
    [self performSelector:@selector(loadTopScrollView) withObject:nil afterDelay:1];
    [_contentScrollView setContentOffset:CGPointMake(0, 0)];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    UIButton *but1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    but1.exclusiveTouch = YES;
    [but1 setBackgroundImage:[UIImage imageNamed:@"not1.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:but1];

    UIButton *but2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    but2.exclusiveTouch = YES;
    [but2 setBackgroundImage:[UIImage imageNamed:@"Not2.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barButton2 = [[UIBarButtonItem alloc] initWithCustomView:but2];

    UIButton *but3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    but3.exclusiveTouch = YES;
    [but3 setBackgroundImage:[UIImage imageNamed:@"not3.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barButton3 = [[UIBarButtonItem alloc] initWithCustomView:but3];

    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:barButton1,barButton2,barButton3, nil];
    
    
    UIButton *but4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    but4.exclusiveTouch = YES;
    [but4 setBackgroundImage:[UIImage imageNamed:@"not4.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barButton4 = [[UIBarButtonItem alloc] initWithCustomView:but4];

    self.navigationItem.rightBarButtonItem = barButton4;

}

-(void)placeViewsOnScrollView
{
    _dphomecontroller= [[DPHomeViewController alloc] initWithNibName:@"DPHomeViewController" bundle:nil];
    [_contentScrollView addSubview:_dphomecontroller.view];
    _dphomecontroller.view.frame = CGRectMake(0, 0, 320, 438);

    
    _servicesViewController= [[DPServicesViewController alloc] initWithNibName:@"DPServicesViewController" bundle:nil];
    [_contentScrollView addSubview:_servicesViewController.view];
    _servicesViewController.view.frame = CGRectMake(320, 0, 320, 438);

    
    _mediaViewController= [[DPMediaViewController alloc] initWithNibName:@"DPMediaViewController" bundle:nil];
    [_contentScrollView addSubview:_mediaViewController.view];
    _mediaViewController.view.frame = CGRectMake(640, 0, 320, 438);

    [_contentScrollView setContentOffset:CGPointMake(0, 0)];

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
        float fractionalPage = scrollView.contentOffset.x / 320.0;
        NSInteger pageIndex = lround(fractionalPage);

//    NSLog(@"the page index is:%d",pageIndex);
    if (currentIndex != pageIndex) {
        currentIndex = pageIndex;
            if (pageIndex == 0 ) {
                [self loadHomeView:homeButton];
            }
            if (pageIndex == 1 ) {
                [self loadServicesView:servicesButton];
            }
            if (pageIndex == 2 ) {
                [self loadMediaView:mediaButton];
            }

    }
}

-(void)placeHomeView
{
    [_contentScrollView setContentOffset:CGPointMake(0, 0)];

}

-(void)placeServicesView
{
    [_contentScrollView setContentOffset:CGPointMake(320, 0)];

}

-(void)placeMediaView
{
    [_contentScrollView setContentOffset:CGPointMake(640, 0)];

}

-(void)loadHomeView:(UIButton *)button
{
    homeButton.enabled = NO;
    servicesButton.enabled = YES;
    mediaButton.enabled = YES;
    
    CGRect frame = _lineView.frame;
    
    frame.origin.x = button.frame.origin.x;
    float diff =  button.center.x - _lineView.center.x ;
    
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         [_lineView setTransform:CGAffineTransformMakeTranslation(diff, 0)];
                     }
                     completion:^(BOOL finished){
                         _lineView.frame =frame;
                         [self placeHomeView];
                     }
     ];
}

-(void)loadServicesView:(UIButton *)button
{
    homeButton.enabled = YES;
    servicesButton.enabled = NO;
    mediaButton.enabled = YES;
    
    CGRect frame = _lineView.frame;
    
    frame.origin.x = button.frame.origin.x;
    float diff =  button.center.x - _lineView.center.x ;
    
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         [_lineView setTransform:CGAffineTransformMakeTranslation(diff, 0)];
                         
                     }
                     completion:^(BOOL finished){
                         _lineView.frame =frame;
                         [self placeServicesView];
                         
                     }
     ];
}

-(void)loadMediaView:(UIButton *)button
{
    
    homeButton.enabled = YES;
    servicesButton.enabled = YES;
    mediaButton.enabled = NO;
    
    CGRect frame = _lineView.frame;
    
    frame.origin.x = button.frame.origin.x;
    float diff =  button.center.x - _lineView.center.x ;
    
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         [_lineView setTransform:CGAffineTransformMakeTranslation(diff, 0)];
                         
                     }
                     completion:^(BOOL finished){
                         _lineView.frame =frame;
                         [self placeMediaView];
                     }
     ];
    
    
}



-(void)loadTopScrollView
{
    _topScrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 40)];
    [self.view addSubview:_topScrollView];
    _topScrollView.backgroundColor = [UIColor whiteColor];
    
    homeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [homeButton addTarget:self
                   action:@selector(loadHomeView:)
     forControlEvents:UIControlEventTouchUpInside];
    [homeButton setTitle:@"HOME" forState:UIControlStateNormal];
    [homeButton setTitleColor:[UIColor redColor]   forState:UIControlStateDisabled];

    [homeButton setTitleColor:[UIColor darkGrayColor]   forState:UIControlStateNormal];

    
    homeButton.frame = CGRectMake(30, 4, 100, 30);
    [_topScrollView  addSubview:homeButton];

    CGRect frame =homeButton.frame;
    frame.origin.y = frame.origin.y + frame.size.height +3;
    frame.size.height = 2;
    
    
    _lineView = [[UIView alloc]initWithFrame:frame];
    _lineView.backgroundColor = [UIColor orangeColor];
    [_topScrollView addSubview:_lineView];
    
    
     servicesButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [servicesButton addTarget:self
                   action:@selector(loadServicesView:)
         forControlEvents:UIControlEventTouchUpInside];
    [servicesButton setTitle:@"Services" forState:UIControlStateNormal];
    servicesButton.frame = CGRectMake(120, 4, 100, 30);
    [servicesButton setTitleColor:[UIColor redColor]   forState:UIControlStateDisabled];
    [servicesButton setTitleColor:[UIColor darkGrayColor]   forState:UIControlStateNormal];

    [_topScrollView  addSubview:servicesButton];

    
    mediaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [mediaButton addTarget:self
                   action:@selector(loadMediaView:)
         forControlEvents:UIControlEventTouchUpInside];
    [mediaButton setTitle:@"Media" forState:UIControlStateNormal];
    mediaButton.frame = CGRectMake(200, 4, 100, 30);
    [mediaButton setTitleColor:[UIColor redColor]   forState:UIControlStateDisabled];
    
    [mediaButton setTitleColor:[UIColor darkGrayColor]   forState:UIControlStateNormal];

    [_topScrollView  addSubview:mediaButton];


    
    homeButton.enabled = NO;
    servicesButton.enabled = YES;
    mediaButton.enabled = YES;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

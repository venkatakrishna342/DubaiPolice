//
//  DPHomeViewController.m
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import "DPHomeViewController.h"
#import "CollectionViewCell.h"

#import <QuartzCore/QuartzCore.h>

#define ITEM_SPACING 1
#define METERS_PER_MILE 1609.344

@interface DPHomeViewController ()
@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@end

static NSString * const reuseIdentifier = @"CollectionViewCell";

@implementation DPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];


    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.collectionView setBounces:YES];
    [self.collectionView setFrame:[[UIScreen mainScreen] bounds]];
    [self.collectionView setAlwaysBounceVertical:YES];
    [self.collectionView setAllowsSelection: NO];
    [self.collectionView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];

    [self applyZoomInOutforLayer:_fpButton.layer];
    [self applyFadeInOutforLayer:_rcButton.layer];
    [self applyZoomInOutforLayer:_rtaButton.layer];
    [self applyVibrationAnimationforLayer:_laysButton];
    [self applyFadeInOutforLayer:_gccButton.layer];
    [self applyVibrationAnimationforLayer:_asButton];


}

-(void)applyZoomInOutforLayer:(CALayer *)layer
{
    CABasicAnimation *fadeInAndOut = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    fadeInAndOut.duration = 3.0;
    fadeInAndOut.autoreverses = YES;
    fadeInAndOut.fromValue = [NSNumber numberWithFloat:0.7];
    fadeInAndOut.toValue = [NSNumber numberWithFloat:1.0];
    fadeInAndOut.repeatCount = HUGE_VALF;
    fadeInAndOut.fillMode = kCAFillModeBoth;
    [layer addAnimation:fadeInAndOut forKey:@"myanimation1"];
}


-(void)applyFadeInOutforLayer:(CALayer *)layer
{
    CABasicAnimation *fadeInAndOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAndOut.duration = 3.0;
    fadeInAndOut.autoreverses = YES;
    fadeInAndOut.fromValue = [NSNumber numberWithFloat:0.10];
    fadeInAndOut.toValue = [NSNumber numberWithFloat:1.0];
    fadeInAndOut.repeatCount = HUGE_VALF;
    fadeInAndOut.fillMode = kCAFillModeBoth;
    [layer addAnimation:fadeInAndOut forKey:@"myanimation"];
}


-(void)applyVibrationAnimationforLayer:(UIButton *)button
{
    CABasicAnimation *fadeInAndOut = [CABasicAnimation animationWithKeyPath:@"position"];
    fadeInAndOut.duration = 3.0;
    fadeInAndOut.autoreverses = YES;
    CGPoint center = button.center;
    center.x = button.center.x-10;
    
    fadeInAndOut.fromValue = [NSValue valueWithCGPoint:center];
    center.x = center.x+20;
    fadeInAndOut.toValue = [NSValue valueWithCGPoint:center];
    fadeInAndOut.repeatCount = HUGE_VALF;
    fadeInAndOut.fillMode = kCAFillModeBoth;
    [button.layer addAnimation:fadeInAndOut forKey:@"myanimation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.contentView addSubview:_favView];
        _favView.frame = CGRectMake(0, 0, 320, 300);
    }    if (indexPath.row == 1) {
        [cell.contentView addSubview:_portsView];
        _portsView.frame = CGRectMake(0, 0, 320, 300);
        [self placeMapViewWithRightCoordinates];
    }    if (indexPath.row == 2) {
        [cell.contentView addSubview:_impNo];
        _impNo.frame = CGRectMake(0, 0, 320, 300);
    }
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(320, 300.0);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return ITEM_SPACING;//* (SB_IS_IPAD?2:1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return ITEM_SPACING;// * (SB_IS_IPAD?2:1);
}

-(IBAction)callButtonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button.tag == 999) {
        _flipView.frame = self.topView.bounds;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.topView cache:YES];
        
        [self.topView addSubview:_flipView];
        //            [self.topView sendSubviewToBack:flipView];
        [UIView commitAnimations];
        currentTag = 999;
        
    }else if (button.tag == 901)
    {
        _flipView.frame = self.bottomView.bounds;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.bottomView cache:YES];
        currentTag = 901;
        [self.bottomView addSubview:_flipView];
        //            [self.topView sendSubviewToBack:flipView];
        [UIView commitAnimations];
        
    }
}

-(IBAction)yesOrNoButtonPressed:(id)sender
{
    UIView *animView;
    if (currentTag == 999) {
        animView =self.topView;
        
    }else if (currentTag == 901)
    {
        animView =self.bottomView;
        
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:animView cache:YES];
    
    [_flipView removeFromSuperview];
    [animView sendSubviewToBack:_flipView];
    [UIView commitAnimations];
    
}

-(void)placeMapViewWithRightCoordinates
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 24.95000;
    zoomLocation.longitude= 55.33333;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    
    
    MKCoordinateSpan span;
    span.latitudeDelta =  0.8;
    span.longitudeDelta = 0.8;
    viewRegion.span = span;
    [_mapView setRegion:viewRegion animated:YES];

}

@end

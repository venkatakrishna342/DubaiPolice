//
//  CollectionViewCell.m
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)addFavVeiw
{
    self.backgroundColor = [UIColor greenColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    _favView.frame = CGRectMake(0, 0, 320, 300);
    [self.contentView addSubview:_favView];
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


@end

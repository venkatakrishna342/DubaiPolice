//
//  CollectionViewCell.h
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
{
    
    int currentTag;
}
@property(nonatomic,strong) IBOutlet UIView *portsView;
@property(nonatomic,strong) IBOutlet UIView *favView;
@property(nonatomic,strong) IBOutlet UIView *impNo;



@property (nonatomic, strong) IBOutlet UIView *topView;
@property (nonatomic, strong) IBOutlet UIView *bottomView;
@property (nonatomic, strong) IBOutlet UIView *flipView;

-(IBAction)callButtonPressed:(id)sender;
-(IBAction)yesOrNoButtonPressed:(id)sender;

-(void)addFavVeiw;
@end

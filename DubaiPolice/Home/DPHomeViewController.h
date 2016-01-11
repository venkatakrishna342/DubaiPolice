//
//  DPHomeViewController.h
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface DPHomeViewController : UIViewController
{
    int currentTag;

}

@property(nonatomic,strong) IBOutlet UIView *portsView;
@property(nonatomic,strong) IBOutlet UIView *favView;
@property(nonatomic,strong) IBOutlet UIView *impNo;

@property(nonatomic,strong) IBOutlet MKMapView *mapView;


@property (nonatomic, strong) IBOutlet UIView *topView;
@property (nonatomic, strong) IBOutlet UIView *bottomView;
@property (nonatomic, strong) IBOutlet UIView *flipView;

-(IBAction)callButtonPressed:(id)sender;
-(IBAction)yesOrNoButtonPressed:(id)sender;



@property (nonatomic, strong) IBOutlet UIButton *fpButton;
@property (nonatomic, strong) IBOutlet UIButton *laysButton;
@property (nonatomic, strong) IBOutlet UIButton *rcButton;

@property (nonatomic, strong) IBOutlet UIButton *gccButton;
@property (nonatomic, strong) IBOutlet UIButton *rtaButton;
@property (nonatomic, strong) IBOutlet UIButton *asButton;

@end

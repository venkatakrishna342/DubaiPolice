//
//  DPServicesViewController.m
//  DubaiPolice
//
//  Created by Venkat Boddapati on 28/01/15.
//  Copyright (c) 2015 Venkat Boddapati. All rights reserved.
//

#import "DPServicesViewController.h"
#import "DPServiceCell.h"

@interface DPServicesViewController ()

@end

@implementation DPServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}// Default is 1 if not implemented


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *simpleTableIdentifier = @"DPServiceCell";
        
        DPServiceCell *cell = (DPServiceCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DPServiceCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat :@"Services%d.png",indexPath.row+1]];
        return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end

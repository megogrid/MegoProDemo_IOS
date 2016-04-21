//
//  CustumClass.m
//  Mego Shop Demo
//
//  Created by jaiom on 26/02/16.
//  Copyright (c) 2016 unity. All rights reserved.
//

#import "CustumClass.h"

NSArray *array;

@implementation CustumClass

-(void)viewDidLoad{
    
    array=[[NSArray alloc] initWithObjects:@"Feature1",@"Feature2", nil];
    self.view.backgroundColor=[UIColor cyanColor];
    [self headerSection];
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,50,self.view.frame.size.width,self.view.frame.size.height)];
    
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
}



-(void)headerSection
{
    UIView*headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,64)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    [self.view addSubview:headerView];
    
    
    UIButton *sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sliderButton setFrame:CGRectMake(15,20,20,21)];
    [sliderButton addTarget:self action:@selector(getSlider)forControlEvents:UIControlEventTouchUpInside];
    [sliderButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [headerView addSubview :sliderButton];
    
    UILabel*groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,10 ,headerView.frame.size.width, 45) ];
    groupLabel.text = @"Shop";
    groupLabel.textAlignment=NSTextAlignmentCenter;
    groupLabel.textColor = [UIColor whiteColor];
    groupLabel.font = [UIFont boldSystemFontOfSize:17];
    [headerView addSubview:groupLabel];
    
   
    
}

-(void)getSlider
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UIButton *btn=nil;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
   // if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        btn=[[UIButton alloc] initWithFrame:CGRectMake(270,10, 40, 20)];
        btn.tag=111;
        [btn setTitle:@"Buy" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor grayColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  //  }
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor lightGrayColor];
    [btn viewWithTag:111];
    [btn addTarget:self action:@selector(tblButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    
    return cell;
}


-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
}

-(void)tblButtonClick:(UIButton*)sender{
    
    NSLog(@"tblButtonClick");
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Premium Features"
                          message:@"This is a Pro Feature\nTap to Buy"
                          delegate:self
                          cancelButtonTitle:@"Cancel" otherButtonTitles:@"Buy",nil];
    [alert show];
    
}

@end

//
//  ConnectViewController.m
//  Mego Shop Demo
//
//  Created by ankit-iphone on 2/12/16.
//  Copyright (c) 2016 unity. All rights reserved.
//

#import "ConnectViewController.h"
#import <MegoPurchase/MegoGridServerManager.h>
@interface ConnectViewController ()<UIGestureRecognizerDelegate>
{
    UIView *mainView;
}

@end

@implementation ConnectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    mainView.backgroundColor=[UIColor colorWithRed:206/255.0f green:206/255.0f blue:206/255.0f alpha:1];
    [self.view addSubview:mainView];
    
    [self headerSection];
    [self loadMainView];
    
}

-(void)headerSection
{
    UIView*headerView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                                0,
                                                                self.view.frame.size.width,
                                                                64)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    [self.view addSubview:headerView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width,45)];
    [headerView addSubview:navView];
    
    UIButton *sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sliderButton setFrame:CGRectMake(15,15,15,15)];
    [sliderButton addTarget:self action:@selector(getSlider)forControlEvents:UIControlEventTouchUpInside];
    [sliderButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [sliderButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateSelected];
    [navView addSubview :sliderButton];
    
    
    UILabel*groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(sliderButton.frame.size.width+20,0 ,navView.frame.size.width, 45) ];
    groupLabel.text = @"Connect";
    groupLabel.textAlignment=NSTextAlignmentLeft;
    groupLabel.textColor = [UIColor whiteColor];
    groupLabel.font = [UIFont boldSystemFontOfSize:17];
    [navView addSubview:groupLabel];
    
    
}

-(void)loadMainView
{
    UIView *FacebookView=[[UIView alloc]initWithFrame:CGRectMake(8, 10, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    FacebookView.userInteractionEnabled=YES;
    FacebookView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:FacebookView];
    UITapGestureRecognizer *configurationTapFBGmail = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickFBGmail)];
    configurationTapFBGmail.delegate = self;
    [FacebookView addGestureRecognizer:configurationTapFBGmail];
    
    
    UIView *emailView=[[UIView alloc]initWithFrame:CGRectMake(8, FacebookView.frame.size.height+20, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    emailView.userInteractionEnabled=YES;
    emailView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:emailView];
    UITapGestureRecognizer *configurationTapEmail = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickEmail)];
    configurationTapEmail.delegate = self;
    [emailView addGestureRecognizer:configurationTapEmail];
    
    UIView *PhoneNumberView=[[UIView alloc]initWithFrame:CGRectMake(8, emailView.frame.origin.y+emailView.frame.size.height+10, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    PhoneNumberView.userInteractionEnabled=YES;
    [mainView addSubview:PhoneNumberView];
    PhoneNumberView.backgroundColor=[UIColor whiteColor];

    UITapGestureRecognizer *configurationTapSms = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickSms)];
    configurationTapSms.delegate = self;
    [PhoneNumberView addGestureRecognizer:configurationTapSms];
    
    UILabel *fbLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, FacebookView.frame.size.width, FacebookView.frame.size.height)];
    [FacebookView addSubview:fbLabel];
    fbLabel.text=@"Get Config of trail days & Count";
    fbLabel.font=[UIFont systemFontOfSize:12];
    fbLabel.textAlignment=NSTextAlignmentCenter;
    
    UILabel *emailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, emailView.frame.size.width,  emailView.frame.size.height)];
    [emailView addSubview:emailLabel];
    emailLabel.numberOfLines=0;
    emailLabel.text=@"Get Config of Max concurrent-Recurrence \n & \n Max Councurrent-NonRecurrence";
    emailLabel.font=[UIFont systemFontOfSize:12];
    emailLabel.textAlignment=NSTextAlignmentCenter;
    
    UILabel *phnLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0, PhoneNumberView.frame.size.width,  PhoneNumberView.frame.size.height)];
    [PhoneNumberView addSubview:phnLabel];
    phnLabel.text=@"Get Config Of Trail Days+Count & Max Individual";
    phnLabel.font=[UIFont systemFontOfSize:12];
    phnLabel.textAlignment=NSTextAlignmentCenter;
    
}

#pragma mark - Header Buttons Click
-(void)getSlider
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)searchButtonClick
{
    
}

-(void)rightMenuClick
{
    
}

#pragma mark - Social Buttons Click

-(void)resetConfigurationClick:(id)sender
{
    int getTag;
    if([sender isKindOfClass:[UIButton class]])
    {
        UIButton *value=sender;
        getTag=(int)value.tag;
    }else{
        getTag=[sender intValue];
    }
    
     MegoGridServerManager*megoGridServerManager=[[MegoGridServerManager alloc]init];
    [megoGridServerManager megoRefresh];
    
    NSMutableArray *appSecretData=[[NSMutableArray alloc]init];
    
    if((getTag==10)||(getTag==11))
    {
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%d",getTag] forKey:@"getApp"];
        [appSecretData addObject:@"1A8CEYH6Z"];
        [appSecretData addObject:@"H0NQIKJZP"];
        //App ID :- 1A8CEYH6Z
        //Secret Key : H0NQIKJZP
    }
    else if(getTag==12)
    {   //App ID :- NMJ18AKHP
       // Secret Key :- KHCOO7OG8
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%d",getTag] forKey:@"getApp"];
        [appSecretData addObject:@"NMJ18AKHP"];
        [appSecretData addObject:@"KHCOO7OG8"];
    }
    else if(getTag==13)
    {     //  App ID :- S8GAOOXTY
           // Secret Key :- 17T9J3YF4
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%d",getTag] forKey:@"getApp"];
        [appSecretData addObject:@"S8GAOOXTY"];
        [appSecretData addObject:@"17T9J3YF4"];
    }
    
    [appSecretData addObject:@"3"];
    [[NSUserDefaults standardUserDefaults]setObject:appSecretData forKey:@"meuserAppSecretKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    NSLog(@"appSecretData=====%@",appSecretData);
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Alert !"
                          message:@"Please Relaunch Application For New Configuration"
                          delegate:nil
                          cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
}

-(void)resetConfigurationClickFBGmail
{
    [self resetConfigurationClick :[NSNumber numberWithInt:11]];
}
-(void)resetConfigurationClickEmail
{
    [self resetConfigurationClick :[NSNumber numberWithInt:12]];
}
-(void)resetConfigurationClickSms
{
    [self resetConfigurationClick :[NSNumber numberWithInt:13]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end

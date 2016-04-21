//  HelpPage.m
//  Mego Shop Demo
//
//  Created by Mohammad on 2/24/16.
//  Copyright (c) 2016 unity. All rights reserved.
//

#import "HelpPage.h"


@interface HelpPage ()<UIScrollViewDelegate>
{
    UIView *mainView;
    UIScrollView *helpScrollView;
    CGFloat headingSize,subheadingSize,contentSize,totalHelpScrollHeight;;
    NSMutableArray *typesNameArray,*contentArray;
}
@end

@implementation HelpPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backGroundUiPart];
    [self  fontSizeCalculation];
    [self headerSection];
    [self  descriptionOfHelpController];
}

#pragma mark UI Part
-(void)backGroundUiPart
{
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    mainView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:mainView];
    helpScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,mainView.frame.size.width,mainView.frame.size.height)];
    [helpScrollView setBackgroundColor:[UIColor clearColor]];
    helpScrollView.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [mainView addSubview:helpScrollView];
    helpScrollView.userInteractionEnabled=TRUE;
    helpScrollView.scrollEnabled=YES;
    helpScrollView.showsVerticalScrollIndicator=TRUE;
    [helpScrollView setContentSize: CGSizeMake(helpScrollView.bounds.size.width,mainView.frame.size.height)];
}

-(void)headerSection
{
    UIView*headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,64)];
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    [self.view addSubview:headerView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width,45)];
    [headerView addSubview:navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(15,12,20,21)];
    [backButton addTarget:self action:@selector(navBackButton)forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateSelected];
    [navView addSubview :backButton];
    
    
    CGSize yourLabelSize = [@"Help" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:headingSize]}];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake((navView.frame.size.width-yourLabelSize.width-10)/2,0 ,yourLabelSize.width+10, 45) ];
    
    
    
    
    title.text = @"Help";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont boldSystemFontOfSize:headingSize];
    [navView addSubview:title];
}

-(void)fontSizeCalculation
{
    if([[UIScreen mainScreen]bounds].size.height<=568) // iPhone4S,iPhone5
    {
        headingSize=20;
        subheadingSize=16;
        contentSize=14;
    }
    else //iPhone6
    {
        headingSize=22;
        subheadingSize=14;
        contentSize=14;
    }
}

#pragma mark Content Part

-(void)descriptionOfHelpController
{
    typesNameArray=[[NSMutableArray alloc]initWithObjects:@"MegoPro:-",@"Trial Days Access:-",@"Count Usage access:-",@"Trial Days+Count Usage:-",@"Max Concurrent Access :-",@"Max Concurrent-Recurrence:-",@"Max Concurrent-NonRecurrence:-",@"Max Individual:-",@"Note:-",nil];
    
    contentArray=[[NSMutableArray alloc]initWithObjects:@"Mepro is one of our Megogrid module which helps you to integrate validations on your premimum feature that should be accessed in a limited way.Unlike giving complete and free access to a feature you can use this module to provide limited acess to them and probe user to unlock it for its pro version \n\n \nThis module provides six types of validation which are as follows:",
                  
                  @"This validation provides access to a feature for limited number of days.Once those days limited days expired User will be prompted with Trial Expired .All Pro feature are locked.Unlock it to use further",
                  
                  @"This validation provides access to feature with specifed number of clicks. if user exceed the clicks it will be locked and He/She has to unlock /buy it",
                  
                  @"This validation is the combination of above two validation types. Rest other things are same",
                  
                  
                  @"This validation is used for the feature in your application which you have represented to the user in form of selection,where user can select as many as He/She can ans then perform a single comman operation on that selected items. Example of such a representation is check boxes that you might have used in selecting image from gellery or your custum selection on item where you want you a comman  operation on them this validtion has two sub parts as follows",
                  
                  @"Considering the above Concurrent Access scenario let us assume that we have maximum acesss of three items(3) for the given days.So according to concurrent Reoccurence validation each time user user will  aceess the items with in the limit of maximum access He/She os left with total access minus the used items for the given day.Ans once he used all the maximum items aceess provided for the given days He/She can,t access further any item fot that day and can only access again on next day ",
                  
                  
                   @"This validation is same as the concurrent Recurrsion the only difference between this validation and above one is user can use maximum item provided at a time not more than that .That means He/She can use the given feature multiple times but maximun items at a time" ,
                  
                  @"This validation is used for the feature in your app which has list of item that you show to the user either by using a list view or grid view. Suppose you have n number of items in a,iist and you want to restrict the access of item to allow user to see only limited once from the top down manner so here come the rescue this is the validation which will help you" ,
                  
                   @"You can change the app configuration by opening the navigation drawer then selecting the configuration from the list. After the click on the desired configuration and relaunch the application by clearing it from the background" ,
                  
                  nil];
    
    
    for(int i=0;i<[typesNameArray count];i++)
    {
        [self  detailForTypes:[typesNameArray objectAtIndex:i]:[contentArray objectAtIndex:i]];
    }
}

-(void)detailForTypes:(NSString*)typesName :(NSString*)content
{
    float myTextHeight = 0;
    totalHelpScrollHeight=totalHelpScrollHeight+26;
    
    CGSize yourLabelSize = [typesName sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize :subheadingSize]}];
    
    UILabel *contentType = [[UILabel alloc]initWithFrame:CGRectMake(10,totalHelpScrollHeight,yourLabelSize.width+20,yourLabelSize.height)];
    contentType.text=[typesName stringByAppendingString:@" "];
    contentType.font=[UIFont boldSystemFontOfSize :subheadingSize];
    contentType.textColor = [UIColor blackColor];
    contentType.textAlignment = NSTextAlignmentLeft;
    [helpScrollView addSubview:contentType];
    totalHelpScrollHeight=totalHelpScrollHeight+yourLabelSize.height+10;
    
    
    UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,totalHelpScrollHeight,helpScrollView.frame.size.width-20,myTextHeight)];
    CGSize maximumSize = CGSizeMake(self.view.frame.size.width-20,CGFLOAT_MAX);
    UIFont *myFont = [UIFont fontWithName:@"Arial" size:contentSize];
    
    CGRect myTextRect = [content boundingRectWithSize:maximumSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:myFont}
                                              context:nil];
    
    CGSize myTextSize = myTextRect.size;
    CGRect newFrame = contentLabel.frame;
    newFrame.size.height = myTextSize.height;
    contentLabel.frame = newFrame;
    contentLabel.numberOfLines=0;
    contentLabel.font = myFont;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    myTextHeight = myTextSize.height;
    contentLabel.text = content;
    contentLabel.textColor = [UIColor grayColor];
    [helpScrollView addSubview:contentLabel];
    totalHelpScrollHeight=contentLabel.frame.origin.y+contentLabel.frame.size.height;
    
    
    if(helpScrollView.frame.size.height<totalHelpScrollHeight)
    {
        [helpScrollView setContentSize: CGSizeMake(helpScrollView.bounds.size.width,totalHelpScrollHeight+20)];
    }
}

-(void)navBackButton{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

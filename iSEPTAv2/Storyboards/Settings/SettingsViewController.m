//
//  SettingsViewController.m
//  iSEPTA
//
//  Created by septa on 9/9/13.
//  Copyright (c) 2013 SEPTA. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
{
    BOOL _use24HourTime;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:@"Settings:24HourTime"];
    if ( object == nil )
    {
        _use24HourTime = NO;  // If nil, no data is in @"Settings:24HourTime" so default to NO
    }
    else
    {
        _use24HourTime = [object boolValue];
    }
    
    [self.swt24Hour setOn: _use24HourTime];
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    BOOL onOff = self.swt24Hour.isOn;
    
    if (_use24HourTime != onOff )
    {
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:onOff] forKey:@"Settings:24HourTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // --== Background Image  ==--
//    UIImageView *bgImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"mainBackground.png"] ];
//    [self.tableView setBackgroundView: bgImageView];

    UIColor *backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"newBG_pattern.png"] ];
    [self.tableView setBackgroundColor: backgroundColor];

    
    UIImage *logo = [UIImage imageNamed:@"SEPTA_logo.png"];
    
    SEPTATitle *newView = [[SEPTATitle alloc] initWithFrame:CGRectMake(0, 0, logo.size.width, logo.size.height) andWithTitle:@"Settings"];
    [newView setImage: logo];
    
    [self.navigationItem setTitleView: newView];
    [self.navigationItem.titleView setNeedsDisplay];

    
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:@"Settings:24HourTime"];
    if ( object == nil )
    {
        _use24HourTime = NO;  // If nil, no data is in @"Settings:24HourTime" so default to NO
    }
    else
    {
        _use24HourTime = [object boolValue];
    }
    
    [self.swt24Hour setOn: _use24HourTime];
    
    
    [self.lblVersionNumber setText: [NSString stringWithFormat:@"Version %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
////#warning Potentially incomplete method implementation.
//    // Return the number of sections.
////    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)viewDidUnload
{
    [self setSwt24Hour:nil];
    [super viewDidUnload];
}

- (IBAction)swt24HourChanged:(id)sender
{
    
    BOOL onOff = self.swt24Hour.isOn;
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:onOff] forKey:@"Settings:24HourTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



@end

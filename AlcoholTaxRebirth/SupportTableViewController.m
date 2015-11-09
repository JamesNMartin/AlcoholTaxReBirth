//
//  SupportTableViewController.m
//  AlcoholTaxRebirth
//
//  Created by James Martin on 11/8/15.
//  Copyright © 2015 James Martin. All rights reserved.
//

#import "SupportTableViewController.h"

@interface SupportTableViewController ()

@end

@implementation SupportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.15 green:0.57 blue:0.44 alpha:1.00];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0)
    {
        return 3;
    }
    if (section == 1)
    {
        return 1;
    }
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"SOURCES USED IN THIS PROJECT", @"SOURCES USED IN THIS PROJECT");
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 && indexPath.section == 0) {
        NSString *sURL = @"https://github.com/cruffenach/CRToast";
        NSURL *URL = [NSURL URLWithString:sURL];
        SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:safari animated:YES completion:nil];
    }
    if (indexPath.row == 1 && indexPath.section == 0) {
        NSString *sURL = @"https://github.com/SocialObjects-Software/AMSlideMenu";
        NSURL *URL = [NSURL URLWithString:sURL];
        SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:safari animated:YES completion:nil];
    }
    if (indexPath.row == 2 && indexPath.section == 0) {
        NSString *sURL = @"https://github.com/sweetmandm/ionicons-iOS";
        NSURL *URL = [NSURL URLWithString:sURL];
        SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:safari animated:YES completion:nil];
    }
    if (indexPath.row == 0 && indexPath.section == 1) {
        NSLog(@"SUPPORT LINKS");
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //SOMETHING HERE MAYBE?
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

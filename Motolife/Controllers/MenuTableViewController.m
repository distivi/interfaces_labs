//
//  MenuTableViewController.m
//  Motolife
//
//  Created by Stas on 23.09.14.
//  Copyright (c) 2014 Stas Dymedyuk. All rights reserved.
//

#import "MenuTableViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface MenuTableViewController ()

@property (nonatomic) NSInteger currentIndex;
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    _menuItems = @[@"FEED_TOP_VIEW_CONTROLLER",
                   @"PROFILE_TOP_VIEW_CONTROLLER",
                   @"MOTO_TOP_VIEW_CONTROLLER",
                   @"FRIENDS_TOP_VIEW_CONTROLLER",
                   @"INVITATIONS_TOP_VIEW_CONTROLLER"];
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex == indexPath.row) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        return;
    }
    
    if (indexPath.row == _menuItems.count) {
        [self.mm_drawerController dismissViewControllerAnimated:YES completion:nil];
    } else {
        NSString *identifier = _menuItems[indexPath.row];
        UIViewController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        
        if (centerViewController) {
            self.currentIndex = indexPath.row;
            [self.mm_drawerController setCenterViewController:centerViewController withCloseAnimation:YES completion:nil];
        } else {
            [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        }
    }
}



@end

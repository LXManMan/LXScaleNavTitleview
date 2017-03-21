

//
//  RootTableViewController.m
//  导航条头像缩放
//
//  Created by zlwl001 on 2017/3/21.
//  Copyright © 2017年 manman. All rights reserved.
//

#import "RootTableViewController.h"
#import "LXScaleNavTitleView.h"
@interface RootTableViewController ()
@property(strong,nonatomic)LXScaleNavTitleView *LXtitleView;
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
 self.navigationItem.titleView =   self.LXtitleView = [[LXScaleNavTitleView alloc]initWithHeaderImageName:@"icon" scrollview:self.tableView] ;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.text =@"哈哈哈";
    // Configure the cell...
    
    return cell;
}




@end

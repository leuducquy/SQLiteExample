//
//  ViewController.h
//  SQliteExample
//
//  Created by quy on 12/11/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBmanager.h"

#import "EditInforViewController.h"
@interface ViewController : UITableViewController
@property (nonatomic, strong) DBmanager *dbManager;

@property (nonatomic, strong) NSArray *arrPeopleInfo;
@property (nonatomic) int recordIDToEdit;

-(void)loadData;
- (IBAction)addNewRecord:(id)sender;


@end


//
//  EditInforViewController.m
//  SQliteExample
//
//  Created by quy on 12/11/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import "EditInforViewController.h"

#import "DBManager.h"

@interface EditInforViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) DBmanager *dbManager;

@end

@implementation EditInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.title = @"Edit User Info";
    self.txtAge.delegate = self;
    
    self.txtLastname.delegate = self;
    self.txtFirstname.delegate = self;
    self.dbManager = [[DBmanager alloc] initWithDatabaseFilename:@"sampledb.sql"];
    
    if (self.recordIDToEdit != -1) {
        // Load the record with the specific ID from the database.
        [self loadInfoToEdit];
    }
    // Do any additional setup after loading the view.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)loadInfoToEdit{
    // Create the query.
    NSString *query = [NSString stringWithFormat:@"select * from peopleInfo where peopleInfoID=%d", self.recordIDToEdit];
    
    // Load the relevant data.
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Set the loaded data to the textfields.
    self.txtFirstname.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"firstname"]];
    self.txtLastname.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"lastname"]];
    self.txtAge.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"age"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveInfor:(id)sender {
    NSString *query;
    if (self.recordIDToEdit == -1) {
        query = [NSString stringWithFormat:@"insert into peopleInfo values(null, '%@', '%@', %d)", self.txtFirstname.text, self.txtLastname.text, [self.txtAge.text intValue]];
    }
    else{
        query = [NSString stringWithFormat:@"update peopleInfo set firstname='%@', lastname='%@', age=%d where peopleInfoID=%d", self.txtFirstname.text, self.txtLastname.text, self.txtAge.text.intValue, self.recordIDToEdit];
    }
    
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}
@end

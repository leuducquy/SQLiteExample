//
//  EditInforViewController.h
//  SQliteExample
//
//  Created by quy on 12/11/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end
@interface EditInforViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLastname;
- (IBAction)saveInfor:(id)sender;
@property (nonatomic, strong) id<EditInfoViewControllerDelegate> delegate;
@property (nonatomic) int recordIDToEdit;
-(void)loadInfoToEdit;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@end

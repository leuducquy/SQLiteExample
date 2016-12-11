//
//  DBmanager.h
//  SQliteExample
//
//  Created by quy on 12/11/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBmanager : NSObject
@property(strong,nonatomic)NSString *documentsDirectory;
@property (strong ,nonatomic)NSString *databseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;

-(void)copyDatabaseIntoDocumentsDirectory;
-(instancetype)initWithDatabaseFilename:(NSString *)dbFileName;
-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;
@end

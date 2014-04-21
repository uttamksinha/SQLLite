//
//  UsersList.m
//  SQLLite
//
//  Created by Uttam on 20/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import "UsersList.h"
#import "UserInfo.h"

@implementation UsersList

static UsersList *_database;

+ (UsersList*)database {
    if (_database == nil) {
        _database = [[UsersList alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"example"
                                                             ofType:@"sqlite"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(_database);
}

- (NSArray *)usersListInfos {
    NSLog(@"I am here");
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, firstname, lastname, email FROM users ORDER BY id DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *firstnameChars = (char *) sqlite3_column_text(statement, 1);
            char *lastnameChars = (char *) sqlite3_column_text(statement, 2);
            char *emailChars = (char *) sqlite3_column_text(statement, 3);
            NSString *firstname = [[NSString alloc] initWithUTF8String:firstnameChars];
            NSString *lastname = [[NSString alloc] initWithUTF8String:lastnameChars];
            NSString *email = [[NSString alloc] initWithUTF8String:emailChars];
            UserInfo *info = [[UserInfo alloc] initWithUniqueId:uniqueId firstname:firstname lastname:lastname email:email];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end

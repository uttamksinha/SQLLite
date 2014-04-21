//
//  UsersList.h
//  SQLLite
//
//  Created by Uttam on 20/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface UsersList : NSObject {
    sqlite3 *_database;
}

+ (UsersList*)database;
- (NSArray *)usersListInfos;

@end

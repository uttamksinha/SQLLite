//
//  UserInfo.m
//  SQLLite
//
//  Created by Uttam on 20/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

@synthesize uniqueId = _uniqueId;
@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize email = _email;

- (id)initWithUniqueId:(int)uniqueId firstname:(NSString *)firstname lastname:(NSString *)lastname email:(NSString *)email {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.firstname = firstname;
        self.lastname = lastname;
        self.email = email;
    }
    return self;
}

- (void) dealloc {
    self.firstname = nil;
    self.lastname = nil;
    self.email = nil;
}

@end

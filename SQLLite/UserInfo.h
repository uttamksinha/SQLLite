//
//  UserInfo.h
//  SQLLite
//
//  Created by Uttam on 20/04/14.
//  Copyright (c) 2014 Uttam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject {
    int _uniqueId;
    NSString *_firstname;
    NSString *_lastname;
    NSString *_email;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *email;

- (id)initWithUniqueId:(int)uniqueId firstname:(NSString *)firstname lastname:(NSString *)lastname email:(NSString *)email;

@end

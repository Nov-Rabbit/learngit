//
//  SoftVersion.m
//  PDCA_Demo
//
//  Created by CW-IT-MB-046 on 14-12-25.
//  Copyright (c) 2014年 CW-IT-MB-046. All rights reserved.
//

#import "SoftVersion.h"

@implementation SoftVersion
{
    NSString* _marketVersion;
    NSString* _pulishVersion;
    NSString* _fullVersion;
}

+ (SoftVersion *) instance
{
    static SoftVersion* _instance = nil;
    dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (id) init
{
    if (self = [super init]) {
        [self generateVersion];
    }
    
    return self;
}

- (void) generateVersion
{
    NSBundle* bundle = [NSBundle mainBundle];
    _marketVersion = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString* buildVer = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"];
    
    _pulishVersion = [_marketVersion stringByAppendingFormat:@".%@", buildVer];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
    _fullVersion = [_pulishVersion stringByAppendingFormat:@".%@", dateString];
    NSLog(@"generateVesion");
}

- (NSString *) getMarketVer
{
    if (_marketVersion == nil) {
        [self getMarketVer];
    }
    
    return _marketVersion;
}

- (NSString *) getPulishVer
{
    if (_pulishVersion == nil) {
        [self generateVersion];
    }
    
    return _pulishVersion;
}

- (NSString *) getFullVer
{
    if (_fullVersion) {
        [self generateVersion];
    }
    
    return _fullVersion;
}

@end

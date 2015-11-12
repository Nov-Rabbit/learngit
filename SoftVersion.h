//
//  SoftVersion.h
//  PDCA_Demo
//
//  Created by CW-IT-MB-046 on 14-12-25.
//  Copyright (c) 2014年 CW-IT-MB-046. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoftVersion : NSObject
+ (SoftVersion *) instance;
- (NSString *) getMarketVer;    // 主版本号
- (NSString *) getPulishVer;    // 软件发布版本号
- (NSString *) getFullVer;      // 内部调试版本号
@end

//
//  CFFriend.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFUtil.h"

enum {
    CFFriendStatusOffline = 0, // 不在线
    CFFriendStatusDriving,  // 正在驾驶（驾驶模式）
    CFFriendStatusRiding,   // 正在搭车（搭车模式）
};
typedef UInt32 CFFriendStatus;

@interface CFFriend : NSObject

@property (nonatomic) CFUID friendID;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *commentName;
@property (nonatomic) BOOL following; // 你是否关注了他，这个在查看哪些人关注了你的时候，可以知道是否相互关注。
@property (nonatomic) BOOL follower; // 他是否也关注你，这个可以列出关注该用户的所有人
@property (nonatomic) CFFriendStatus friendStatus;

@property (nonatomic, strong) NSArray *friendStatusString;


@end

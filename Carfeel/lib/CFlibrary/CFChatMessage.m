//
//  CFChatMessage.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFChatMessage.h"

@interface CFChatMessage ()

@property (nonatomic, readwrite) NSString *message;
@property (nonatomic, readwrite) CFUID fromUID;
@property (nonatomic, readwrite) CFUID toUID;
@property (nonatomic, readwrite) NSDate *date;
//这条msg在数据库里面的id，send 成功之后保存到数据库，并产生一个ID，作为send是否成功的一个返回值。
//最好可以做成这个会话里面的ID，这样的话便于以后扩展，基本上可以无限制扩展了。
@property (nonatomic, readwrite) NSUInteger msgID;  

@property (nonatomic, strong) NSArray *sent;
@property (nonatomic, strong) NSArray *recieved;

@end

@implementation CFChatMessage

@synthesize message = _message;
@synthesize fromUID = _fromUID;
@synthesize toUID = _toUID;
@synthesize date = _date;


- (void) initWithMessage:(NSString *)message from:(CFUID)from to:(CFUID)to
{
    self.message = [message copy];
    self.fromUID = from;
    self.toUID = to;
    self.date = [NSDate date];
    self.msgID = 0; //0表示这条信息还没有发送成功，因为他还没有msgID
}


// send message
// recieve message
// delete message


@end

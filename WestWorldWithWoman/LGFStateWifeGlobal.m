//
//  LGFStateWifeGlobal.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateWifeGlobal.h"

static LGFStateWifeGlobal* _instance = nil;

@implementation LGFStateWifeGlobal

+ (LGFStateWifeGlobal*) stateWifeGlobal
{
    if (nil == _instance)
    {
        _instance = [[LGFStateWifeGlobal alloc] init];
    }
    
    return _instance;
}

- (void) enter:(id)entity
{
    
}

- (void) execute:(id)entity
{
    
}

- (void) exit:(id)entity
{

}

@end

//
//  LGFStateWifeDoHouseWork.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateWifeDoHouseWork.h"

static LGFStateWifeDoHouseWork* _instance = nil;

@implementation LGFStateWifeDoHouseWork

+ (LGFStateWifeDoHouseWork*) stateWifeDoHouseWork
{
    if (nil == _instance)
    {
        _instance = [[LGFStateWifeDoHouseWork alloc] init];
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

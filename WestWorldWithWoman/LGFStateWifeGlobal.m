//
//  LGFStateWifeGlobal.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateWifeGlobal.h"
#import "LGFStateWifeTendHousePlants.h"
#import "LGFStateMachine.h"
#import "LGFEntityMinersWife.h"

static LGFStateWifeGlobal* _instance = nil;
static int _tend_flowers_counter = 0;

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
    if (++_tend_flowers_counter > 7)
    {
        _tend_flowers_counter = 0;
        [[entity stateMachine] changeState:[LGFStateWifeTendHousePlants stateWifeTendHousePlants]];
    }
}

- (void) exit:(id)entity
{

}

@end

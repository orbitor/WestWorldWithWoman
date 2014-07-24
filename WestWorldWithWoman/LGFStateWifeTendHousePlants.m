//
//  LGFStateWifeTendHousePlants.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateWifeTendHousePlants.h"
#import "LGFEntityMinersWife.h"
#import "LGFStateMachine.h"

static LGFStateWifeTendHousePlants* _instance = nil;

@implementation LGFStateWifeTendHousePlants

+ (LGFStateWifeTendHousePlants*) stateWifeTendHousePlants
{
    if (nil == _instance)
    {
        _instance = [[LGFStateWifeTendHousePlants alloc] init];
    }
    
    return _instance;
}

- (void) enter:(id)entity
{
    NSLog(@"Wife: Getting the watering can");
}

- (void) execute:(id)entity
{
    NSLog(@"Wife: Watered all the plants");
    [[entity stateMachine] revertToPreviousState];
}

- (void) exit:(id)entity
{
    NSLog(@"Wife: Putting away the watering can");
}

@end

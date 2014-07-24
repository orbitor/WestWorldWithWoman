//
//  LGFStateMinerQuenchThirst.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateMinerQuenchThirst.h"
#import "LGFEntityMiner.h"
#import "LGFStateMinerEnterMineAndDigNuggets.h"
#import "LGFStateMachine.h"

static LGFStateMinerQuenchThirst* _instance = nil;

@implementation LGFStateMinerQuenchThirst
@synthesize pantsLostCount;

+ (LGFStateMinerQuenchThirst*) stateMinerQuenchThirst
{
    if (nil == _instance)
    {
        _instance = [[LGFStateMinerQuenchThirst alloc] init];
        [_instance setPantsLostCount:0];
    }
    
    return _instance;
}

- (void) enter:(LGFEntityMiner *)miner
{
    if (LGF_LT_SALOON != [miner currentLocation])
    {
        [miner changeLocation:LGF_LT_SALOON];
        NSLog(@"Miner: Thirsty! Walking to the saloon");
    }
}

- (void) execute:(LGFEntityMiner *)miner
{
    if (YES == [miner isThirsty])
    {
        [miner buyAndDrinkWhiskey];
        NSLog(@"Miner: I wish I didn't like whiskey as much as I do. But, I sure do!");

        [[miner stateMachine] changeState:[LGFStateMinerEnterMineAndDigNuggets stateMinerEnterMineAndDigNuggets]];
    }
    else
    {
        NSLog(@"Oops. Something went wrong");
    }
}

- (void) exit:(LGFEntityMiner *)miner
{
    if (3 < [self pantsLostCount])
    {
        NSLog(@"Miner: Seriously...has anyone seen my pants?");
        [self setPantsLostCount:0];
    }
    else
    {
        NSLog(@"Miner: Leaving the saloon. Where did my pants make off to?");
        [self setPantsLostCount:[self pantsLostCount] + 1];
    }
}

@end

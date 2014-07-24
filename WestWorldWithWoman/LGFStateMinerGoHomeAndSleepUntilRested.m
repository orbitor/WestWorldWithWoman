//
//  LGFStateMinerGoHomeAndSleepUntilRested.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateMinerGoHomeAndSleepUntilRested.h"
#import "LGFEntityMiner.h"
#import "LGFStateMinerEnterMineAndDigNuggets.h"
#import "LGFStateMachine.h"

static LGFStateMinerGoHomeAndSleepUntilRested* _instance = nil;

@implementation LGFStateMinerGoHomeAndSleepUntilRested

+ (LGFStateMinerGoHomeAndSleepUntilRested*) stateMinerGoHomeAndSleepUntilRested
{
    if (nil == _instance)
    {
        _instance = [[LGFStateMinerGoHomeAndSleepUntilRested alloc] init];
    }
    
    return _instance;
}

- (void) enter:(LGFEntityMiner *)miner
{
    if (LGF_LT_SHACK != [miner currentLocation])
    {
        NSLog(@"Miner: Walking home");
        [miner changeLocation:LGF_LT_SHACK];
    }
}

- (void) execute:(LGFEntityMiner *)miner
{
    if (NO == [miner isFatigued])
    {
        NSLog(@"Miner: Great nap. Time to find more gold");
        [[miner stateMachine] changeState:[LGFStateMinerEnterMineAndDigNuggets stateMinerEnterMineAndDigNuggets]];
    }
    else
    {
        [miner decreaseFatigue];
        NSLog(@"Miner: ZZZZZZZZZ.....");
    }
}

- (void) exit:(LGFEntityMiner *)miner
{
    NSLog(@"Miner: Leaving the house");
}

@end

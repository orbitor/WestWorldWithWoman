//
//  LGFStateMinerEnterMineAndDigNuggets.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateMinerEnterMineAndDigNuggets.h"
#import "LGFEntityMiner.h"
#import "LGFStateMinerVisitBankAndDepositGold.h"
#import "LGFStateMinerQuenchThirst.h"
#import "LGFStateMachine.h"

static LGFStateMinerEnterMineAndDigNuggets* _instance = nil;

@implementation LGFStateMinerEnterMineAndDigNuggets

+ (LGFStateMinerEnterMineAndDigNuggets*) stateMinerEnterMineAndDigNuggets
{
    if (nil == _instance)
    {
        _instance = [[LGFStateMinerEnterMineAndDigNuggets alloc] init];
    }
    
    return _instance;
}

- (void) enter:(id) entity
{
    if (LGF_LT_GOLDMINE != [entity currentLocation])
    {
        NSLog(@"Miner: Walking to the mine");
        [entity changeLocation:LGF_LT_GOLDMINE];
    }
}

- (void) execute:(id) entity
{   
    [entity addToCarriedGold:1];
    [entity increaseFatigue];
    
    NSLog(@"Miner: Picking up a nugget");
    
    if (YES == [entity arePocketsFull])
    {
        [[entity stateMachine] changeState:[LGFStateMinerVisitBankAndDepositGold stateMinerVisitBankAndDepositGold]];
    }
    
    if (YES == [entity isThirsty])
    {
        [[entity stateMachine] changeState:[LGFStateMinerQuenchThirst stateMinerQuenchThirst]];
    }
}

- (void) exit:(id) entity
{
    NSLog(@"Miner: Leaving the gold mine with my pockets full of gold");
}

@end

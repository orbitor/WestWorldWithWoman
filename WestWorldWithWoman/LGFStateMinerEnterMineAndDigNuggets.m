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

- (void) enter:(LGFEntityBase*) entity
{
    /*TODO: I am sure that this is the wrong way to do this. Need
     * to put some thought into the object graph and how it differs
     * from the C++ version of this code.
     */
    LGFEntityMiner* miner = (LGFEntityMiner*) entity;
    
    if (LGF_LT_GOLDMINE != [miner currentLocation])
    {
        NSLog(@"Miner: Walking to the mine");
        [miner setCurrentLocation: LGF_LT_GOLDMINE];
    }
}

- (void) execute:(LGFEntityBase*) entity
{
    LGFEntityMiner* miner = (LGFEntityMiner*) entity;
    
    [miner addToCarriedGold:1];
    [miner increaseFatigue];
    
    NSLog(@"Miner: Picking up a nugget");
    
    if (YES == [miner arePocketsFull])
    {
        [miner changeState:[LGFStateMinerVisitBankAndDepositGold stateMinerVisitBankAndDepositGold]];
    }
    
    if (YES == [miner isThirsty])
    {
        [miner changeState:[LGFStateMinerQuenchThirst stateMinerQuenchThirst]];
    }
}

- (void) exit:(LGFEntityBase*) entity
{
    NSLog(@"Miner: Leaving the gold mine with my pockets full of gold");
}

@end

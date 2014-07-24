//
//  LGFStateMinerVisitBankAndDepositGold.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateMinerVisitBankAndDepositGold.h"
#import "LGFEntityMiner.h"
#import "LGFStateMinerGoHomeAndSleepUntilRested.h"
#import "LGFStateMinerEnterMineAndDigNuggets.h"
#import "LGFStateMachine.h"

static LGFStateMinerVisitBankAndDepositGold* _instance = nil;

@implementation LGFStateMinerVisitBankAndDepositGold

+ (LGFStateMinerVisitBankAndDepositGold*) stateMinerVisitBankAndDepositGold
{
    if (nil == _instance)
    {
        _instance = [[LGFStateMinerVisitBankAndDepositGold alloc] init];
    }
    
    return _instance;
}

- (void) enter:(LGFEntityMiner *)miner
{
    if (LGF_LT_BANK != [miner currentLocation])
    {
        NSLog(@"Miner: Going to the bank");
        [miner changeLocation:LGF_LT_BANK];
    }
}

- (void) execute:(LGFEntityMiner *)miner
{
    [miner addToMoneyInBank:[miner carriedGold]];
    [miner setCarriedGold:0];
    
    NSLog(@"Miner: Depositing gold at the bank. Total savings now %d",
          [miner moneyInBank]);
    
    if (YES == [miner hasReachedComfortLevel])
    {
        NSLog(@"Miner: Rich enough for now. Back home to my lady");
        [[miner stateMachine] changeState:[LGFStateMinerGoHomeAndSleepUntilRested stateMinerGoHomeAndSleepUntilRested]];
    }
    else
    {
        [[miner stateMachine] changeState:[LGFStateMinerEnterMineAndDigNuggets stateMinerEnterMineAndDigNuggets]];
    }
}

- (void) exit:(LGFEntityMiner *)miner
{
    NSLog(@"Miner: Leaving the bank");
}

@end

//
//  LGFEntityMiner.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityMiner.h"
#import "LGFStateMachine.h"
#import "LGFStateMinerGoHomeAndSleepUntilRested.h"

static const int GoldComfortThreshold = 5;
static const int CarriedNuggestsThreshold = 3;
static const int ThirstThreshold = 5;
static const int TirednessThreshold = 5;

@implementation LGFEntityMiner

@synthesize stateMachine;
@synthesize currentLocation;
@synthesize carriedGold;
@synthesize moneyInBank;
@synthesize thirstLevel;
@synthesize fatigueLevel;

- (id) init
{
    self = [self initWithEntityId:10];
    
    currentLocation = LGF_LT_SHACK;
    
    stateMachine = [LGFStateMachine stateMachineWithOwner:self];
    [stateMachine setCurrentState:[LGFStateMinerGoHomeAndSleepUntilRested stateMinerGoHomeAndSleepUntilRested]];
    
    return self;
}

/* override of LGFEntityBase */
- (void) update
{
    [self setThirstLevel:[self thirstLevel] + 1];

    [[self stateMachine] update];
}

/* instance members */
- (void) changeLocation:(LGFLocationType)newLocation
{
    currentLocation = newLocation;
}

- (void) addToCarriedGold:(int) add_gold;
{
    int gold = [self carriedGold];
    gold += add_gold;
    
    if (gold < 0)
    {
        gold = 0;
    }
    
    [self setCarriedGold:gold];
}

- (void) addToMoneyInBank:(int) add_money;
{
    int money = [self moneyInBank];
    money += add_money;
    
    [self setMoneyInBank:money];
}

- (void) buyAndDrinkWhiskey
{
    [self setThirstLevel:0];
    [self addToMoneyInBank:-2];
}

- (void) increaseFatigue
{
    [self setFatigueLevel:[self fatigueLevel] + 1];
}

- (void) decreaseFatigue
{
    [self setFatigueLevel:[self fatigueLevel] - 1];
}

- (bool) arePocketsFull
{
    int gold = [self carriedGold];
    
    return gold >= CarriedNuggestsThreshold ? YES : NO;
}

- (bool) hasReachedComfortLevel
{
    int comfort = [self moneyInBank];
    
    return comfort >= GoldComfortThreshold ? YES : NO;
}

- (bool) isThirsty
{
    int thirst = [self thirstLevel];
    
    return thirst >= ThirstThreshold ? YES : NO;
}

- (bool) isFatigued
{
    int fatigue = [self fatigueLevel];
    return fatigue >= TirednessThreshold ? YES : NO;
}

@end

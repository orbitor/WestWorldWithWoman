//
//  LGFEntityMiner.m
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityMiner.h"
#import "LGFState.h"
#import "LGFStateMinerGoHomeAndSleepUntilRested.h"

static const int GoldComfortThreshold = 5;
static const int CarriedNuggestsThreshold = 3;
static const int ThirstThreshold = 5;
static const int TirednessThreshold = 5;

@implementation LGFEntityMiner

@synthesize currentState;
@synthesize currentLocation;
@synthesize carriedGold;
@synthesize moneyInBank;
@synthesize thirstLevel;
@synthesize fatigueLevel;

- (id) init
{
    self = [self initWithEntityId:10];
    
    [self setCurrentLocation:LGF_LT_SHACK];
    
    /*TODO: is this necessary? Does ObjC say anything about how
     * a structure is zero'd?
     */
    [self setCarriedGold:0];
    [self setMoneyInBank:0];
    [self setThirstLevel:0];
    [self setFatigueLevel:0];
    
    currentState = [LGFStateMinerGoHomeAndSleepUntilRested stateMinerGoHomeAndSleepUntilRested];
    
    return self;
}

/* override of LGFEntityBase */
- (void) update
{
    [self setThirstLevel:[self thirstLevel] + 1];

    [[self currentState] execute:self];
}

/* instance members */
- (void) changeState:(LGFState*) new_state;
{
    [[self currentState] exit: self];
    currentState = new_state;
    [[self currentState] enter: self];
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

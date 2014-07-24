//
//  LGFEntityMiner.h
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityBase.h"

@class LGFStateMachine;

@interface LGFEntityMiner : LGFEntityBase
{
    @private
        LGFStateMachine*    stateMachine;
        LGFLocationType     currentLocation;
        int                 carriedGold;
        int                 moneyInBank;
        int                 thirstLevel;
        int                 fatigueLevel;
}

@property(nonatomic, readonly) LGFStateMachine* stateMachine;
@property(nonatomic, readonly) LGFLocationType currentLocation;
@property(nonatomic) int carriedGold;
@property(nonatomic) int moneyInBank;
@property(nonatomic) int thirstLevel;
@property(nonatomic) int fatigueLevel;

- (void) changeLocation:(LGFLocationType) newLocation;
- (void) addToCarriedGold: (int) addGold;
- (void) addToMoneyInBank: (int) addMoney;
- (void) buyAndDrinkWhiskey;
- (void) increaseFatigue;
- (void) decreaseFatigue;
- (bool) arePocketsFull;
- (bool) hasReachedComfortLevel;
- (bool) isThirsty;
- (bool) isFatigued;

@end

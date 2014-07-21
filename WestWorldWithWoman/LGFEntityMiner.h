//
//  LGFEntityMiner.h
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityBase.h"

@class LGFState;

@interface LGFEntityMiner : LGFEntityBase
{
    @private
        LGFState*       currentState;
        LGFLocationType currentLocation;
        int             carriedGold;
        int             moneyInBank;
        int             thirstLevel;
        int             fatigueLevel;
}

@property(nonatomic, readonly) LGFState* currentState;
@property(nonatomic) LGFLocationType currentLocation;
@property(nonatomic) int carriedGold;
@property(nonatomic) int moneyInBank;
@property(nonatomic) int thirstLevel;
@property(nonatomic) int fatigueLevel;

/* instance members */
- (void) changeState: (LGFState*) new_state;
- (void) addToCarriedGold: (int) add_gold;
- (void) addToMoneyInBank: (int) add_money;
- (void) buyAndDrinkWhiskey;
- (void) increaseFatigue;
- (void) decreaseFatigue;
- (bool) arePocketsFull;
- (bool) hasReachedComfortLevel;
- (bool) isThirsty;
- (bool) isFatigued;

@end

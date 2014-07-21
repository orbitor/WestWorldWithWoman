//
//  LGFStateMachine.h
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/20/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGFEntityBase;
@class LGFState;

@interface LGFStateMachine : NSObject
{
    LGFEntityBase* ownerEntity;
    LGFState* currentState;
    LGFState* previousState;
    LGFState* globalState;
}

@property LGFEntityBase* ownerEntity;
@property LGFState* currentState;
@property LGFState* previousState;
@property LGFState* globalState;

+ (LGFStateMachine*) stateMachineWithOwner:(LGFEntityBase*) owner;

- (void) changeState:(LGFState*)newState;
- (void) revertToPreviousState;
- (bool) isInState:(LGFState*)compareState;

@end

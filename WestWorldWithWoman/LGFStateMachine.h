//
//  LGFStateMachine.h
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/20/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGFStateMachine : NSObject
{
    id ownerEntity;
    id currentState;
    id previousState;
    id globalState;
}

@property id ownerEntity;
@property id currentState;
@property id previousState;
@property id globalState;

+ (LGFStateMachine*) stateMachineWithOwner:(id) owner;

- (void) update;
- (void) changeState:(id)newState;
- (void) revertToPreviousState;
- (bool) isInState:(id)compareState;

@end

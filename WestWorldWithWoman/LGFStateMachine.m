//
//  LGFStateMachine.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/20/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFStateMachine.h"
#import "LGFEntityBase.h"
#import "LGFState.h"

@implementation LGFStateMachine

@synthesize ownerEntity;
@synthesize currentState;
@synthesize previousState;
@synthesize globalState;

+ (LGFStateMachine*) stateMachineWithOwner:(LGFEntityBase *)owner
{
    LGFStateMachine* sm = [[LGFStateMachine alloc] init];
    [sm setOwnerEntity:owner];
    return sm;
}

- (void) changeState:(LGFState*)newState
{
    [self setPreviousState:[self currentState]];
    [[self currentState] exit:[self ownerEntity]];
    [self setCurrentState:newState];
    [[self currentState] enter:[self ownerEntity]];
}

- (void) revertToPreviousState
{
    
}

/*TODO: how does NSObject:isKindOfClass work? And could it be useful
 * here?
 */
- (bool) isInState:(LGFState*)compareState
{
    return NO;
}

@end

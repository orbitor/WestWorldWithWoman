//
//  LGFEntityMinersWife.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityMinersWife.h"
#import "LGFStateMachine.h"
#import "LGFStateWifeDoHouseWork.h"
#import "LGFStateWifeGlobal.h"

@implementation LGFEntityMinersWife

@synthesize stateMachine;
@synthesize currentLocation;

- (id) init
{
    self = [self initWithEntityId:10];
    
    currentLocation = LGF_LT_SHACK;
    
    stateMachine = [LGFStateMachine stateMachineWithOwner:self];
    [stateMachine setCurrentState:[LGFStateWifeDoHouseWork stateWifeDoHouseWork]];
    [stateMachine setGlobalState:[LGFStateWifeGlobal stateWifeGlobal]];
    
    return self;
}

- (void) update
{
    [[self stateMachine] update];
}

- (void) changeLocation:(LGFLocationType) newLocation
{
    currentLocation = newLocation;
}

@end

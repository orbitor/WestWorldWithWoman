//
//  LGFEntityMinersWife.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityMinersWife.h"
#import "LGFStateMachine.h"

@implementation LGFEntityMinersWife

@synthesize stateMachine;
@synthesize currentLocation;

- (void) update
{
    [[self stateMachine] update];
}

- (void) changeLocation:(LGFLocationType) newLocation
{
    currentLocation = newLocation;
}

@end

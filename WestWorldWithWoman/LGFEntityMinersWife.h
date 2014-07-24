//
//  LGFEntityMinersWife.h
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/24/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityBase.h"

@class LGFStateMachine;

@interface LGFEntityMinersWife : LGFEntityBase
{
    @private
    LGFStateMachine* stateMachine;
    LGFLocationType currentLocation;
}

@property(nonatomic, readonly) LGFStateMachine* stateMachine;
@property(nonatomic, readonly) LGFLocationType currentLocation;

- (void) update;
- (void) changeLocation:(LGFLocationType) newLocation;

@end

//
//  LGFBaseEntity.m
//  WestWorld
//
//  Created by James DeLisle on 7/18/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import "LGFEntityBase.h"

static int _nextValidEntityId = 0;

@implementation LGFEntityBase

@synthesize entityId;

+ (int) nextValidEntityId
{
    return ++_nextValidEntityId;
}

- (id) initWithEntityId:(int) entity_id
{
    self = [super init];
    [self setEntityId:entity_id];
    _nextValidEntityId = entityId + 1;
    return self;
}

- (id) init
{
    self = [self initWithEntityId:[LGFEntityBase nextValidEntityId]];
    return self;
}

- (void) update
{
    NSLog(@"BaseEntity update");
}

@end

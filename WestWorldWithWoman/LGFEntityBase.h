//
//  LGFBaseEntity.h
//  WestWorld
//
//  Created by James DeLisle on 7/18/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    LGF_LT_SHACK,
    LGF_LT_GOLDMINE,
    LGF_LT_BANK,
    LGF_LT_SALOON
} LGFLocationType;

@interface LGFEntityBase : NSObject
{
    int entityId;
}

@property (nonatomic) int entityId;

+ (int) nextValidEntityId;

- (id) initWithEntityId:(int) entity_id;
- (id) init;

- (void) update;

@end

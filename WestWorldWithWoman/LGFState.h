//
//  LGFState.h
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGFEntityBase;

@interface LGFState : NSObject

/*TODO: These are all pure virtual methods -- making this class
 * pure virtual in C++ terminology. Come back to this when it
 * makes sense how to do this in ObjC
 */
- (void) enter:(LGFEntityBase*) entity;
- (void) execute:(LGFEntityBase*) entity;
- (void) exit:(LGFEntityBase*) entity;

@end

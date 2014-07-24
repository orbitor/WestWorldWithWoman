//
//  LGFState.h
//  WestWorld
//
//  Created by James DeLisle on 7/19/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGFState : NSObject

/*TODO: These are all pure virtual methods -- making this class
 * pure virtual in C++ terminology. Come back to this when it
 * makes sense how to do this in ObjC.
 *
 * This would probably be best implemented as a formal protocol -
 * not a 'base class'. Although, I could see 'LGFState' as being
 * a cluster and all the other states as the concrete classes.
 */
- (void) enter:(id) entity;
- (void) execute:(id) entity;
- (void) exit:(id) entity;

@end

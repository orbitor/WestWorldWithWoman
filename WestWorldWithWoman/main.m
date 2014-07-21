//
//  main.m
//  WestWorldWithWoman
//
//  Created by James DeLisle on 7/20/14.
//  Copyright (c) 2014 James DeLisle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGFEntityMiner.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        LGFEntityMiner* miner = [[LGFEntityMiner alloc] init];
        int i;
        
        for (i = 0; i < 40; ++i)
        {
            [miner update];
        }
    }
    return 0;
}


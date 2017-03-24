//
//  main.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

int main()
{
    @autoreleasepool {
        
        Game *game = [[Game alloc] initWithPlayerNames:@[@"Alice", @"Bob"]];
        [game start];
        
    }
    return 0;
}

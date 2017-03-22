//
//  main.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *alice = [[Player alloc] initWithName:@"Alice"];
        while ([alice play]) {
            // Just wait
        }
        NSLog(@"Score is %lu", alice.score);
        
    }
    return 0;
}

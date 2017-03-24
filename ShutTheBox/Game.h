//
//  Game.h
//  ShutTheBox
//
//  Created by Ev Bogdanov on 24/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Game : NSObject

- (instancetype)initWithPlayerNames:(NSArray *)names;
- (void)start;

@end

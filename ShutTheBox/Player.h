//
//  Player.h
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Dice.h"

@interface Player : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *tiles;
@property (nonatomic) NSUInteger score;

// Public methods
- (instancetype)initWithName:(NSString *)name;
- (BOOL)play;

@end

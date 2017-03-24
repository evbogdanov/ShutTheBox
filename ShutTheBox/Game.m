//
//  Game.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 24/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import "Game.h"

@interface Game ()

@property (strong, nonatomic) NSArray *players;

@end

@implementation Game

- (instancetype)initWithPlayerNames:(NSArray *)names
{
    self = [super init];
    if (self) {
        NSMutableArray *players = [[NSMutableArray alloc] init];
        for (NSString *name in names) {
            Player *player = [[Player alloc] initWithName:name];
            [players addObject:player];
        }
        _players = [NSArray arrayWithArray:players];
    }
    return self;
}

- (void)start
{
    NSString *winnerName = @"No winner";
    NSUInteger winnerScore = NSUIntegerMax;

    for (Player *player in self.players) {
        while ([player play]) {
            // Just wait
        }

        // If a player succeeds in closing all of the numbers,
        // he or she is said to have "Shut the Box" – the player
        // wins immediately and the game is over.
        if (player.score == 0) {
            NSLog(@"%@: shuts the box!", player.name);
            return;
        }
        
        NSLog(@"%@: score is %lu", player.name, player.score);
        
        // The player with the lowest score wins.
        if (player.score < winnerScore) {
            winnerName = player.name;
            winnerScore = player.score;
        }
    }
    
    NSLog(@"Winner is %@", winnerName);
}

@end

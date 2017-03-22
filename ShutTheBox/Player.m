//
//  Player.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import "Player.h"

@interface Player ()

// Redeclare public readonly score to be writable
@property (nonatomic, readwrite) NSUInteger score;

// Private methods
- (BOOL)isFirstTileOpen;
- (NSArray *)openNumbers;
- (void)closeTileWithNumber:(NSUInteger)number;
- (NSUInteger)sumNumbers:(NSArray *)numbers;
- (NSArray *)findCombinationWithSum:(NSUInteger)sum
                            numbers:(NSArray *)numbers;
- (NSArray *)findCombinationWithSum:(NSUInteger)sum
                            numbers:(NSArray *)numbers
                        combination:(NSArray *)combination;

@end

@implementation Player

// PUBLIC METHODS
// -----------------------------------------------------------------------------

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        // Set name
        _name = name;
        
        // Set tiles
        NSMutableArray *tiles = [[NSMutableArray alloc] init];
        for (NSUInteger num = [Tile minNumber]; num <= [Tile maxNumber]; num += 1) {
            Tile *tile = [[Tile alloc] initWithNumber:num];
            [tiles addObject:tile];
        }
        _tiles = tiles;
        
        // Set score
        _score = 0;
     }
    
    return self;
}

// Return:
// YES -- keep playing
// NO  -- stop
- (BOOL)play
{
    NSArray *numbers = [self openNumbers];
    NSUInteger count = [numbers count];
    if (count == 0) {
        // No open numbers. Score is 0 (default; aka "Shut the Box")
        return NO;
    }

    NSLog(@"Open numbers: %@", numbers);
    
    NSUInteger sum;
    // If 1 is the only tile still open, the player may roll only one die
    if (count == 1 && [self isFirstTileOpen]) {
        sum = [Dice roll];
    }
    // Otherwise, the player must roll both dice
    else {
        sum = [Dice roll] + [Dice roll];
    }
    
    NSLog(@"Sum: %lu", sum);
    
    NSArray *combination = [self findCombinationWithSum:sum numbers:numbers];
    if ([combination count] == 0) {
        // No combination to close remaining tiles.
        // Calculate the final score!
        self.score = [self sumNumbers:numbers];
        return NO;
    }
    
    NSLog(@"Combination: %@", combination);
    
    // Close tile for each number in this combination
    for (NSNumber *num in combination) {
        [self closeTileWithNumber:[num unsignedIntegerValue]];
    }
    
    return YES;
}

// PRIVATE METHODS
// -----------------------------------------------------------------------------

- (BOOL)isFirstTileOpen
{
    Tile *firstTile = self.tiles[0];
    return firstTile.isOpen;
}

- (NSArray *)openNumbers
{
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    for (Tile *tile in self.tiles) {
        if (tile.isOpen) {
            NSNumber *number = [NSNumber numberWithUnsignedInteger:tile.number];
            [numbers addObject:number];
        }
    }
    
    return numbers;
}

- (void)closeTileWithNumber:(NSUInteger)number
{
    for (Tile *tile in self.tiles) {
        if (tile.isOpen && tile.number == number) {
            tile.open = NO;
            break;
        }
    }
}

- (NSUInteger)sumNumbers:(NSArray *)numbers
{
    NSUInteger sum = 0;
    for (NSNumber *num in numbers) {
        sum += [num unsignedIntegerValue];
    }
    return sum;
}

- (NSArray *)findCombinationWithSum:(NSUInteger)sum
                            numbers:(NSArray *)numbers
{
    return [self findCombinationWithSum:sum numbers:numbers combination:@[]];
}

- (NSArray *)findCombinationWithSum:(NSUInteger)sum
                            numbers:(NSArray *)numbers
                        combination:(NSArray *)combination
{
    NSUInteger count = [numbers count];
    // End of recursion
    if (count == 0) {
        if ([self sumNumbers:combination] == sum) {
            return combination;
        }
        return @[];
    }
    
    NSNumber *first = numbers[0];
    NSArray *rest = [numbers subarrayWithRange:NSMakeRange(1, count-1)];

    NSMutableArray *combo = [NSMutableArray arrayWithArray:combination];
    [combo addObject:first];
    NSArray *foundCombination1 = [self findCombinationWithSum:sum numbers:rest combination:combo];
    if ([foundCombination1 count] > 0) {
        return foundCombination1;
    }
    
    NSArray *foundCombination2 = [self findCombinationWithSum:sum numbers:rest combination:combination];
    if ([foundCombination2 count] > 0) {
        return foundCombination2;
    }
    
    // Combination not found
    return @[];
}

@end

//
//  Tile.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import "Tile.h"

@implementation Tile

+ (NSUInteger)minNumber
{
    return 1;
}

+ (NSUInteger)maxNumber
{
    return 9;
}

- (instancetype)initWithNumber:(NSUInteger)number
{
    self = [super init];
    
    if (self) {
        _number = number;
        _open = YES;
    }
    
    return self;
}


@end

//
//  Dice.m
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import "Dice.h"

@implementation Dice

+ (NSUInteger)roll
{
    unsigned int min = 1;
    unsigned int max = 6;
    return arc4random_uniform(max) + min;
}

@end

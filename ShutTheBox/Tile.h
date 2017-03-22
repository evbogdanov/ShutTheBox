//
//  Tile.h
//  ShutTheBox
//
//  Created by Ev Bogdanov on 20/03/2017.
//  Copyright © 2017 Ev Bogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

@property (nonatomic, readonly) NSUInteger number; // minNumber..maxNumber
@property (nonatomic, getter=isOpen) BOOL open;

+ (NSUInteger)minNumber;
+ (NSUInteger)maxNumber;

- (instancetype)initWithNumber:(NSUInteger)number;

@end

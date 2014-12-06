//
//  SEQUSequence.m
//  Pods
//
//  Created by Fabian Canas on 12/3/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

#import "SEQUSequence.h"

@interface SEQUSequence () {
    NSArray *_outArray;
}

@property (nonatomic, copy) NSArray *backingArray;
@property (nonatomic, strong) NSArray *maps;

- (instancetype)initWithArray:(NSArray *)array NS_DESIGNATED_INITIALIZER;

@end

@implementation SEQUSequence

- (instancetype)init
{
    self = [self initWithArray:@[]];
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _backingArray = [array copy];
        _maps = @[];
        _outArray = nil;
    }
    return self;
}

+ (instancetype)sequenceWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}

- (instancetype)initWithArray:(NSArray *)array maps:(NSArray *)maps
{
    self = [self initWithArray:array];
    if (self) {
        _maps = maps;
    }
    return self;
}

- (SEQUSequence *)map:(id(^)(id))block
{
    return [[SEQUSequence alloc] initWithArray:self.backingArray
                                          maps:[self.maps arrayByAddingObject:[block copy]]];
}

- (NSArray *)array
{
    if (_outArray == nil) {
        NSMutableArray *a = [NSMutableArray arrayWithCapacity:self.backingArray.count];
        [self.backingArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            for ( id(^block)(id) in self.maps ) {
                [a addObject:block(obj)];
            }
        }];
        _outArray = a;
    }
    return _outArray;
}

@end

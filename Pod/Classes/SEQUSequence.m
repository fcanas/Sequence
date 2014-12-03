//
//  SEQUSequence.m
//  Pods
//
//  Created by Fabian Canas on 12/3/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

#import "SEQUSequence.h"

@interface SEQUSequence () {
    NSArray *_array;
    NSArray *_outArray;
}
@property (nonatomic, strong) NSArray *maps;
@end


@implementation SEQUSequence

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _array = array;
        _maps = @[];
        _outArray = nil;
    }
    return self;
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
    return [[SEQUSequence alloc] initWithArray:_array maps:[self.maps arrayByAddingObject:[block copy]]];
}

- (NSArray *)array
{
    if (_outArray == nil) {
        NSMutableArray *a = [NSMutableArray arrayWithCapacity:_array.count];
        [_array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            for ( id(^block)(id) in self.maps) {
                [a addObject:block(obj)];
            }
        }];
        _outArray = a;
    }
    return _outArray;
}

@end

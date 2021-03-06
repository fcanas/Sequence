//
//  SEQUSequence.h
//  Pods
//
//  Created by Fabian Canas on 12/3/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEQUSequence : NSObject

+ (instancetype)sequenceWithArray:(NSArray *)array;

- (NSArray *)array;

- (SEQUSequence *)map:(id(^)(id))block;

@end

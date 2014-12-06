//
//  SequenceTests.m
//  SequenceTests
//
//  Created by Fabian Canas on 12/03/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <Sequence/SEQUSequence.h>

SpecBegin(InitialSpecs)

describe(@"Sequence", ^{
    
    it(@"can have an array", ^{
        SEQUSequence *s = [SEQUSequence sequenceWithArray:@[@1, @2, @3, @4]];
        expect(s.array).notTo.beNil;
    });
    
    describe(@"map", ^{
        it(@"should return a sequence with a non-nil array", ^{
            SEQUSequence *s = [SEQUSequence sequenceWithArray:@[@1, @2, @3, @4]];
            s = [s map:^id(NSNumber *n) {
                return @([n integerValue] + 1);
            }];
            expect(s.array).toNot.beNil();
        });
    });
    
    it(@"can map identities", ^{
        SEQUSequence *s = [SEQUSequence sequenceWithArray:@[@1, @2, @3, @4]];
        s = [s map:^id(NSNumber *n) {
            return @([n integerValue] + 1);
        }];
        expect(s.array[0]).to.equal(2);
        expect(s.array[1]).to.equal(3);
        expect(s.array[2]).to.equal(4);
        expect(s.array[3]).to.equal(5);
    });
    
});

SpecEnd

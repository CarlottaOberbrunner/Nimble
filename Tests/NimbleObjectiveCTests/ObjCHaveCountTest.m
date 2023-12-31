#import "NimbleSpecHelper.h"

@interface ObjCHaveCountTest : XCTestCase

@end

@implementation ObjCHaveCountTest

- (void)testHaveCountForNSArray {
    expect(@[@1, @2, @3]).to(haveCount(@3));
    expect(@[@1, @2, @3]).notTo(haveCount(@1));

    expect(@[]).to(haveCount(@0));
    expect(@[@1]).notTo(haveCount(@0));

    expect(@[@1, @2, @3]).to(haveCount(3));
    expect(@[@1, @2, @3]).notTo(haveCount(1));

    expect(@[]).to(haveCount(0));
    expect(@[@1]).notTo(haveCount(0));

    expectFailureMessage(@"expected to have NSArray with count 1, got 3. Actual Value: (1, 2, 3)", ^{
        expect(@[@1, @2, @3]).to(haveCount(@1));
    });

    expectFailureMessage(@"expected to not have NSArray with count 3, got 3. Actual Value: (1, 2, 3)", ^{
        expect(@[@1, @2, @3]).notTo(haveCount(@3));
    });

    expectFailureMessage(@"expected to have NSArray with count 1, got 3. Actual Value: (1, 2, 3)", ^{
        expect(@[@1, @2, @3]).to(haveCount(1));
    });

    expectFailureMessage(@"expected to not have NSArray with count 3, got 3. Actual Value: (1, 2, 3)", ^{
        expect(@[@1, @2, @3]).notTo(haveCount(3));
    });
}

- (void)testHaveCountForNSDictionary {
    expect(@{@"1":@1, @"2":@2, @"3":@3}).to(haveCount(@3));
    expect(@{@"1":@1, @"2":@2, @"3":@3}).notTo(haveCount(@1));

    expect(@{@"1":@1, @"2":@2, @"3":@3}).to(haveCount(3));
    expect(@{@"1":@1, @"2":@2, @"3":@3}).notTo(haveCount(1));

    expectFailureMessage(@"expected to have NSDictionary with count 1, got 3. Actual Value: {1 = 1;2 = 2;3 = 3;}", ^{
        expect(@{@"1":@1, @"2":@2, @"3":@3}).to(haveCount(@1));
    });

    expectFailureMessage(@"expected to not have NSDictionary with count 3, got 3. Actual Value: {1 = 1;2 = 2;3 = 3;}", ^{
        expect(@{@"1":@1, @"2":@2, @"3":@3}).notTo(haveCount(@3));
    });

    expectFailureMessage(@"expected to have NSDictionary with count 1, got 3. Actual Value: {1 = 1;2 = 2;3 = 3;}", ^{
        expect(@{@"1":@1, @"2":@2, @"3":@3}).to(haveCount(1));
    });

    expectFailureMessage(@"expected to not have NSDictionary with count 3, got 3. Actual Value: {1 = 1;2 = 2;3 = 3;}", ^{
        expect(@{@"1":@1, @"2":@2, @"3":@3}).notTo(haveCount(3));
    });
}

- (void)testHaveCountForNSHashtable {
    NSHashTable *const table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
    [table addObject:@1];
    [table addObject:@2];
    [table addObject:@3];

    expect(table).to(haveCount(@3));
    expect(table).notTo(haveCount(@1));

    expect(table).to(haveCount(3));
    expect(table).notTo(haveCount(1));

    NSString *tableDescription = [table.description stringByReplacingOccurrencesOfString:@"\n" withString:@""];

    NSString *msg = [NSString stringWithFormat:
                     @"expected to have %@with count 1, got 3. Actual Value: %@",
                     tableDescription,
                     tableDescription];
    expectFailureMessage(msg, ^{
        expect(table).to(haveCount(@1));
    });

    msg = [NSString stringWithFormat:
           @"expected to not have %@with count 3, got 3. Actual Value: %@",
           tableDescription,
           tableDescription];
    expectFailureMessage(msg, ^{
        expect(table).notTo(haveCount(@3));
    });


    msg = [NSString stringWithFormat:
           @"expected to have %@with count 1, got 3. Actual Value: %@",
           tableDescription,
           tableDescription];
    expectFailureMessage(msg, ^{
        expect(table).to(haveCount(1));
    });

    msg = [NSString stringWithFormat:
           @"expected to not have %@with count 3, got 3. Actual Value: %@",
           tableDescription,
           tableDescription];
    expectFailureMessage(msg, ^{
        expect(table).notTo(haveCount(3));
    });
}

- (void)testHaveCountForNSSet {
    NSSet *const set = [NSSet setWithArray:@[@1, @2, @3]];

    expect(set).to(haveCount(@3));
    expect(set).notTo(haveCount(@1));
    expect(set).to(haveCount(3));
    expect(set).notTo(haveCount(1));

    expectFailureMessage(@"expected to have NSSet with count 1, got 3. Actual Value: {(3,1,2)}", ^{
        expect(set).to(haveCount(@1));
    });

    expectFailureMessage(@"expected to not have NSSet with count 3, got 3. Actual Value: {(3,1,2)}", ^{
        expect(set).notTo(haveCount(@3));
    });

    expectFailureMessage(@"expected to have NSSet with count 1, got 3. Actual Value: {(3,1,2)}", ^{
        expect(set).to(haveCount(1));
    });

    expectFailureMessage(@"expected to not have NSSet with count 3, got 3. Actual Value: {(3,1,2)}", ^{
        expect(set).notTo(haveCount(3));
    });
}

- (void)testHaveCountForNSIndexSet {
    NSIndexSet *const set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 3)];

    expect(set).to(haveCount(@3));
    expect(set).notTo(haveCount(@1));
    expect(set).to(haveCount(3));
    expect(set).notTo(haveCount(1));

    expectFailureMessage(@"expected to have NSIndexSet with count 1, got 3. Actual Value: (1, 2, 3)", ^{
        expect(set).to(haveCount(@1));
    });

    expectFailureMessage(@"expected to not have NSIndexSet with count 3, got 3. Actual Value: (1, 2, 3)", ^{
        expect(set).notTo(haveCount(@3));
    });

    expectFailureMessage(@"expected to have NSIndexSet with count 1, got 3. Actual Value: (1, 2, 3)", ^{
        expect(set).to(haveCount(1));
    });

    expectFailureMessage(@"expected to not have NSIndexSet with count 3, got 3. Actual Value: (1, 2, 3)", ^{
        expect(set).notTo(haveCount(3));
    });
}

- (void)testHaveCountForUnsupportedTypes {
    expectFailureMessage(@"expected to get type of NSArray, NSSet, NSDictionary, or NSHashTable, got __NSCFConstantString", ^{
        expect(@"string").to(haveCount(@6));
    });

    expectFailureMessageRegex(@"expected to get type of NSArray, NSSet, NSDictionary, or NSHashTable, got [_a-zA-Z]+Number", ^{
        expect(@1).to(haveCount(@6));
    });

    expectFailureMessage(@"expected to get type of NSArray, NSSet, NSDictionary, or NSHashTable, got __NSCFConstantString", ^{
        expect(@"string").to(haveCount(6));
    });

    expectFailureMessageRegex(@"expected to get type of NSArray, NSSet, NSDictionary, or NSHashTable, got [_a-zA-Z]+Number", ^{
        expect(@1).to(haveCount(6));
    });
}

- (void)testNilMatches {
    expectNilFailureMessage(@"expected to have a collection with count 3, got <nil>", ^{
        expect(nil).to(haveCount(3));
    });
    expectNilFailureMessage(@"expected to not have a collection with count 3, got <nil>", ^{
        expect(nil).toNot(haveCount(3));
    });
}

@end

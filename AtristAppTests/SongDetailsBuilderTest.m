//
//  SongDetailsBuilderTest.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SongDetailsBuilder.h"
#import "SongDetails.h"

static NSString *album = @"album";
static NSString *artist = @"artist";
static NSString *duration = @"duration";
static NSString *imageUrl = @"imageUrl";
static NSString *status = @"status";
static NSString *timeconst = @"time";
static NSString *title = @"title";
static NSString *type = @"type";

@interface SongDetailsBuilderTest : XCTestCase
{
    SongDetailsBuilder *builder;
}

@end

@implementation SongDetailsBuilderTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    builder = [[SongDetailsBuilder alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testSetEntityDataNilTest {
    [builder setEntityData:nil];
    NSLog(@"App should not crash");
    XCTAssertTrue(YES);
}

- (void)testGetEntityReturnType {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:album forKey:album];
    [dic setValue:artist forKey:album];
    [dic setValue:duration forKey:duration];
    [dic setValue:imageUrl forKey:imageUrl];
    [dic setValue:status forKey:status];
    [dic setValue:timeconst forKey:timeconst];
    [dic setValue:title forKey:title];
    [dic setValue:type forKey:type];
    [builder setEntityData:dic];
    
    SongDetails *details = [builder getEntity];
    XCTAssertTrue([details isKindOfClass:[SongDetails class]]);
}

- (void)testGetEntityHasCorrectValue {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:album forKey:album];
    [dic setValue:artist forKey:artist];
    [dic setValue:duration forKey:duration];
    [dic setValue:imageUrl forKey:imageUrl];
    [dic setValue:status forKey:status];
    [dic setValue:timeconst forKey:timeconst];
    [dic setValue:title forKey:title];
    [dic setValue:type forKey:type];
    [builder setEntityData:dic];
    
    SongDetails *details = [builder getEntity];
    XCTAssertTrue([album isEqualToString:details.album]);
    XCTAssertTrue([artist isEqualToString:details.artist]);
    XCTAssertTrue([duration isEqualToString:details.duration]);
    XCTAssertTrue([imageUrl isEqualToString:details.imageUrl]);
    XCTAssertTrue([status isEqualToString:details.status]);
    XCTAssertTrue([timeconst isEqualToString:details.time]);
    XCTAssertTrue([title isEqualToString:details.title]);
    XCTAssertTrue([type isEqualToString:details.type]);
}

- (void)testGetEntityHasCorrectValueOneValueLess {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:album forKey:album];
    [dic setValue:artist forKey:artist];
    [dic setValue:duration forKey:duration];
    [dic setValue:imageUrl forKey:imageUrl];
    [dic setValue:status forKey:status];
    [dic setValue:timeconst forKey:timeconst];
    [dic setValue:type forKey:type];
    [builder setEntityData:dic];
    
    SongDetails *details = [builder getEntity];
    XCTAssertTrue([album isEqualToString:details.album]);
    XCTAssertTrue([artist isEqualToString:details.artist]);
    XCTAssertTrue([duration isEqualToString:details.duration]);
    XCTAssertTrue([imageUrl isEqualToString:details.imageUrl]);
    XCTAssertTrue([status isEqualToString:details.status]);
    XCTAssertTrue([timeconst isEqualToString:details.time]);
    XCTAssertTrue([type isEqualToString:details.type]);
}

@end

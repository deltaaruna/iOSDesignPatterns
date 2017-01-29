//
//  ArtistWebServiceTest.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArtistWebService.h"

@interface ArtistWebServiceTest : XCTestCase
{
    ArtistWebService *service;
}

@end

@implementation ArtistWebServiceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    service = [[ArtistWebService alloc] init];
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

- (void)testSingleTon {
    service = [ArtistWebService getSharedInstance];
    ArtistWebService *objTwo = [ArtistWebService getSharedInstance];
    XCTAssertEqualObjects(service, objTwo);
}

- (void)testCallWebServiceNoError {
    [service callService:^(NSArray *resultArray, NSError *error) {
        XCTAssertNil(error);
    }];
}

- (void)testCallWebServiceArraySize {
    [service callService:^(NSArray *resultArray, NSError *error) {
        XCTAssertGreaterThan([resultArray count], 0);
    }];
}

@end

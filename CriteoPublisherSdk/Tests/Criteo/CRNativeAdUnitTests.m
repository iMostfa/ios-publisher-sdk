//
//  CRNativeAdUnitTests.m
//  CriteoPublisherSdkTests
//
//  Copyright © 2018-2020 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <XCTest/XCTest.h>
#import "CRNativeAdUnit.h"
#import "CRAdUnit+Internal.h"

@interface CRNativeAdUnitTests : XCTestCase

@end

@implementation CRNativeAdUnitTests

- (void)testNativeAdUnitInitialization {
  NSString *expectedAdUnitId = @"expected";
  CRAdUnitType expectedType = CRAdUnitTypeNative;
  CRNativeAdUnit *NativeAdUnit = [[CRNativeAdUnit alloc] initWithAdUnitId:expectedAdUnitId];
  XCTAssertTrue([[NativeAdUnit adUnitId] isEqual:expectedAdUnitId]);
  XCTAssertEqual([NativeAdUnit adUnitType], expectedType);
}

- (void)testSameAdUnitsHaveSameHash {
  CRNativeAdUnit *adUnit1 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"String1"];
  CRNativeAdUnit *adUnit2 =
      [[CRNativeAdUnit alloc] initWithAdUnitId:[@"Str" stringByAppendingString:@"ing1"]];

  XCTAssertEqual(adUnit1.hash, adUnit2.hash);
}

- (void)testSameAdUnitsAreEqual {
  CRNativeAdUnit *adUnit1 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"String1"];
  CRNativeAdUnit *adUnit2 =
      [[CRNativeAdUnit alloc] initWithAdUnitId:[@"Str" stringByAppendingString:@"ing1"]];

  XCTAssert([adUnit1 isEqual:adUnit1]);
  XCTAssert([adUnit2 isEqual:adUnit2]);

  XCTAssert([adUnit1 isEqual:adUnit2]);
  XCTAssert([adUnit2 isEqual:adUnit1]);

  XCTAssert([adUnit1 isEqualToAdUnit:adUnit2]);
  XCTAssert([adUnit2 isEqualToAdUnit:adUnit1]);

  XCTAssertEqualObjects(adUnit1, adUnit2);
}

- (void)testDifferentAdUnitsHaveDifferentHash {
  CRNativeAdUnit *adUnit1 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"String1"];
  CRNativeAdUnit *adUnit2 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"Changed"];

  XCTAssertNotEqual(adUnit1.hash, adUnit2.hash);
}

- (void)testDifferentAdUnitsAreNotEqual {
  CRNativeAdUnit *adUnit1 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"String1"];
  CRNativeAdUnit *adUnit2 = [[CRNativeAdUnit alloc] initWithAdUnitId:@"Changed"];

  XCTAssertFalse([adUnit1 isEqual:adUnit2]);
  XCTAssertFalse([adUnit2 isEqual:adUnit1]);

  XCTAssertNotEqualObjects(adUnit1, adUnit2);
}

@end

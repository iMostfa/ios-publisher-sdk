//
//  NSObject+CriteoTests.m
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
#import "NSObject+Criteo.h"
#import "CR_TargetingKeys.h"

@interface NSObject_CriteoTests : XCTestCase

@end

@implementation NSObject_CriteoTests

- (void)testObjectIsEqualTo {
  XCTAssertTrue([NSObject cr_object:@"a" isEqualTo:@"a"]);
  XCTAssertFalse([NSObject cr_object:@"a" isEqualTo:@"b"]);
  XCTAssertFalse([NSObject cr_object:@"a" isEqualTo:nil]);
  XCTAssertFalse([NSObject cr_object:nil isEqualTo:@"a"]);
  XCTAssertTrue([NSObject cr_object:nil isEqualTo:nil]);
}

- (void)testCriteoTargetingKeysConstantsWereNotChanged {
  XCTAssertEqualObjects(CR_TargetingKey_crtCpm, @"crt_cpm");
  XCTAssertEqualObjects(CR_TargetingKey_crtDisplayUrl, @"crt_displayUrl");
  XCTAssertEqualObjects(CR_TargetingKey_crtDfpDisplayUrl, @"crt_displayurl");

  XCTAssertEqualObjects(CR_TargetingKey_crtnTitle, @"crtn_title");
  XCTAssertEqualObjects(CR_TargetingKey_crtnDesc, @"crtn_desc");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPrice, @"crtn_price");
  XCTAssertEqualObjects(CR_TargetingKey_crtnClickUrl, @"crtn_clickurl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnCta, @"crtn_cta");
  XCTAssertEqualObjects(CR_TargetingKey_crtnImageUrl, @"crtn_imageurl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnAdvName, @"crtn_advname");
  XCTAssertEqualObjects(CR_TargetingKey_crtnAdvDomain, @"crtn_advdomain");
  XCTAssertEqualObjects(CR_TargetingKey_crtnAdvLogoUrl, @"crtn_advlogourl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnAdvUrl, @"crtn_advurl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPrUrl, @"crtn_prurl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPrImageUrl, @"crtn_primageurl");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPrText, @"crtn_prtext");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPixCount, @"crtn_pixcount");
  XCTAssertEqualObjects(CR_TargetingKey_crtnPixUrl, @"crtn_pixurl_");
}

@end

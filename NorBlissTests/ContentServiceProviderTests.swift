//
//  ContentServiceProviderTests.swift
//  NorBlissTests
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import XCTest
@testable import NorBliss

class ContentServiceProviderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    func testAContentService() {
        MockServiceManager.contentService.contentList(api: Api.list) { (cards) in
            let cardsCount = cards?.count ?? 0
            XCTAssertTrue(cardsCount > 0)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

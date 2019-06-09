//
//  ViewModelTests.swift
//  NorBlissTests
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import XCTest
@testable import NorBliss

class ViewModelTests: XCTestCase {

    var viewModel: ViewModel?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testAMovie() {
        viewModel = ViewModel()

        viewModel?.fetchMoviesList {
            XCTAssertTrue(self.viewModel?.sortedMovieList().count == 3)
            XCTAssertTrue(self.viewModel?.searchMovies("The").count == 2)
            XCTAssertTrue(self.viewModel?.searchMovies("Hulk").count == 1)
            XCTAssertTrue(self.viewModel?.movies[0].content.title == "The Shawshank Redemption")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}

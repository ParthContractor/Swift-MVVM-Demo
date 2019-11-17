//
//  Swift_MVVM_DemoTests.swift
//  Swift-MVVM-DemoTests
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import XCTest
@testable import Swift_MVVM_Demo

class Swift_MVVM_DemoTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStringToDate(){
        let strDate = "1999-05-19"
        XCTAssertNotNil(strDate.asDate)
        XCTAssertNotEqual(strDate.asDate, Date())
    }
   
    func testStringToDateWithUnexpectedFormat(){
           let strDate = "09-11-1980"
           XCTAssertNotNil(strDate.asDate)
            XCTAssertEqual(strDate.asDate.dateWithoutTime(), Date().dateWithoutTime())
    }
    
    func testMoviesListViewModel(){
        let objMoviesListViewModel = MoviesListViewModel()
        XCTAssertNotNil(objMoviesListViewModel)
        let exp = expectation(description: "fetchData")
        objMoviesListViewModel.fetchData {
            DispatchQueue.main.async {
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(objMoviesListViewModel.navigationBarTitleForLandingView)
        XCTAssertEqual(objMoviesListViewModel.navigationBarTitleForLandingView, "SW Movies")
        XCTAssertNil(objMoviesListViewModel.RESTServiceError)
        XCTAssertNotEqual(objMoviesListViewModel.dataSource?.count, 0)
    }
    
}

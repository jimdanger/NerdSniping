//
//  Tests_Kata04.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 4/28/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//


import XCTest
@testable import AlgorithmsAndDataStructures

class Tests_Kata04: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReadFile() {
        let fileReader = KataFileReader()
        var string: String?
        do {
            try string = fileReader.readFile(fileName: "weather", fileExtention: "dat")
            
        } catch Kata04Errors.cannotReadFile {
            
        } catch Kata04Errors.fileNotFound {
            
        } catch let error {
            print(error.localizedDescription)
        }
        XCTAssertNotNil(string)
    }
    

    
    func testIntFromString() {
        guard let intFromString: Int = Int("5") else
        {
            return 
        }
            XCTAssertEqual(intFromString, 5)
    }
    
    func test_calculateDaySmallestTemperatureSpread(){
        
        let asdf = PartOneWeatherData()
        let result = asdf.calculateDateOfSmallestTemperatureSpread()
        XCTAssertEqual(result, 14) // 14 is the correct answer
    }
    
    
    func test_doesStringHaveAsterisk_noAsteriskIsFalse() {
        let day = Kata04Day(day: 1, maxTemp: "1", minTemp: "1")
        XCTAssertEqual(day.maxTemp.isMonthRecord, false)
    }
    
    func test_doesStringHaveAsterisk_AsteriskIsTrue() {
        let day = Kata04Day(day: 1, maxTemp: "1*", minTemp: "1")
        XCTAssertEqual(day.maxTemp.isMonthRecord, true)
    }
    
    func test_Kata04Day_init() {
        let day = Kata04Day(day: 1, maxTemp: "1*", minTemp: "1")
        XCTAssertEqual(day.maxTemp.temp, 1)
    }
  
    
    func test_getNextItemFromStringStartingAtLocation() {
        let weatherDataApp = PartOneWeatherData()
        let testString = "   Hello World"
        let result = weatherDataApp.getNextItemFromStringStartingAtLocation(string: testString, startingLocation: 0)
        XCTAssertEqual(result, "Hello")

    }
    
    func test_getNextItemFromStringStartingAtLocation_2() {
        let weatherDataApp = PartOneWeatherData()
        let testString = "H ello World"
        let result = weatherDataApp.getNextItemFromStringStartingAtLocation(string: testString, startingLocation: 0)
        XCTAssertEqual(result, "H")
        
    }
    
    func test_getNextItemFromStringStartingAtLocation_3() {
        let weatherDataApp = PartOneWeatherData()
        let testString = "       "
        let result = weatherDataApp.getNextItemFromStringStartingAtLocation(string: testString, startingLocation: 0)
        XCTAssertEqual(result, "")
        
    }
  
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

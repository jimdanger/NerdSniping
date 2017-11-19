////
////  File.swift
////  AlgorithmsAndDataStructures
////
////  Created by Jim Wilson on 7/24/17.
////  Copyright © 2017 Jim Danger, LLC. All rights reserved.
////
//
//import Foundation
///**
// Total spots in the parking structure: 1000
// Rates:
// - Open: 8am and close: 10pm
// - Free up to 3 hrs.
// - 5$ per hr charge after 3 hrs (starts charging from the 4th hour) up to max of 25$.
// */
//import Foundation
//
//// helper method
//func createDate(month: Int, day: Int, year: Int, hour: Int, minute: Int, second: Int? = 0) -> Date {
//    let dateComponents = NSDateComponents()
//    dateComponents.month = month
//    dateComponents.day = day
//    dateComponents.year = year
//    dateComponents.hour = hour
//    dateComponents.minute = minute
//    dateComponents.second = second!
//    
//    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
//    return calendar!.date(from: dateComponents as DateComponents)!
//}
//
//func getHourAndMinute(fromDate: Date) -> (h: Int, m: Int){
//    var components = Calendar.current.dateComponents([.hour, .minute], from: fromDate)
//    return (components.hour!, components.minute!)
//}
//
//func assertBoolean(actual: Bool, expected: Bool) {
//    print(actual == expected)
//}
//
//func assert(actual: Int, expected: Int) {
//    print(actual == expected)
//}
//
//protocol ParkingSystemType {
//    
//    /*
//     Current total number of available parking spots in the structure
//     
//     @return Int - indicates how much spots are currently
//     available in the structure
//     */
//    func currentAvailableSpots() -> Int
//    
//    /*
//     Record the vehicles entering the parking structure with its license number and in time
//     
//     @params licenseNumber - unqiue identifier of each vehicle
//     @params inTime - the in time of the vehicle
//     
//     @return Bool - if the vehicle is allowed and successfully enter the parking lot
//     */
//    func vehicleEnter(licenseNumber: String, inTime: Date) -> Bool
//    
//    /*
//     Calculate and record the payment the owner is making.
//     
//     @params licenseNumber - unqiue identifier of each vehicle
//     @params outTime - the out time of the vehicle
//     
//     @return Int - The amount of the owner has paid
//     */
//    func vehicleCheckout(licenseNumber: String, outTime: Date) -> Int
//    
//    /*
//     Vehicle is leaving the parking lot. Vehicle can only leave the parking lot
//     after the payment is made.
//     
//     @params licenseNumber - unqiue identifier of each vehicle
//     
//     @return Bool - if the vehicle is allowed and can leave the parking lot
//     */
//    func vehicleExit(licenseNumber: String) -> Bool
//}
//
//// your implementation goes here.
//
//class Car {
//    var hasPaid: Bool = false
//    var licensePlate: String = ""
//    var inTime: Date = Date()
//    init () {
//        
//    }
//}
//
//class ParkingSystem: ParkingSystemType {
//    
//    var capacity: Int
//    private var availableSpots: Int
//    
//    var parkedCars: [String : Car] = [String : Car]()
//    
//    
//    init (capacity: Int) {
//        self.capacity = capacity
//        availableSpots = capacity
//    }
//    
//    func currentAvailableSpots() -> Int {
//        
//        
//        return availableSpots
//    }
//    
//    func vehicleEnter(licenseNumber: String, inTime: Date) -> Bool {
//        
//        if !(availableSpots > 0) || !isLotOpen(inTime: inTime)   {
//            return false
//        }
//        
//        if let carAlreadyInLot = parkedCars[licenseNumber] {
//            return false
//        }
//        let car: Car = Car()
//        car.licensePlate = licenseNumber
//        car.inTime = inTime
//        parkedCars[licenseNumber] = car
//        availableSpots -= 1
//        return true
//    }
//    
//    
//    
//    /*
//     Calculate and record the payment the owner is making.
//     
//     @params licenseNumber - unqiue identifier of each vehicle
//     @params outTime - the out time of the vehicle
//     
//     @return Int - The amount of the owner has paid
//     */
//    func vehicleCheckout(licenseNumber: String, outTime: Date) -> Int {
//        guard let carInTime = parkedCars[licenseNumber] else {
//            return -1
//        }
//        
//        let inTimeTulple = getHourAndMinute(fromDate: carInTime)
//        let outTimeTulple = getHourAndMinute(fromDate: outTime)
//        var hoursInLot = outTimeTulple.h - inTimeTulple.h
//        let minInLot = outTimeTulple.m - inTimeTulple.m
//        if minInLot > 0 {
//            hoursInLot += 1
//        }
//        
//        var result = 0
//        if hoursInLot < 4 {
//            return result
//        } else {
//            result = hoursInLot * 5
//        }
//        
//        return result <= 25 ? result : 25
//    }
//    
//    
//    
//    func vehicleExit(licenseNumber: String) -> Bool {
//        guard let car = parkedCars[licenseNumber] else {
//            return false
//        }
//        
//        let now = Date()
//        if !isLotOpen(inTime: now) {
//            return false
//        }
//        
//        let result = car.hasPaid
//        
//        if car.hasPaid {
//            parkedCars[licenseNumber] = nil
//            availableSpots += 1
//        }
//        
//        return result
//    }
//    
//    private func isLotOpen(inTime: Date) -> Bool  {
//        
//        let timeTulple = getHourAndMinute(fromDate: inTime)
//        let hour = timeTulple.h
//        let min = timeTulple.m
//        
//        if hour > 7 && hour < 22 {
//            return true
//        }
//        return false
//    }
//}
//
//
//
//// sample test cases
//let parkingSystem: ParkingSystemType = ParkingSystem(capacity: 1000)
//
//let vehicleOne = "6CD189A"
//let vehicleTwo = "5AD1123A"
//
//
//let now = Date()
//
//func testCases() {
//    // Vehicle one entering the parking lot
//    parkingSystem.vehicleEnter(licenseNumber: vehicleOne, inTime: now)
//    assert(actual: parkingSystem.currentAvailableSpots(), expected: 999)
//    
//    // Vehicle two entering the parking lot
//    let thirtyMinutesLater = now.addingTimeInterval(60*30)
//    parkingSystem.vehicleEnter(licenseNumber: vehicleTwo, inTime: thirtyMinutesLater)
//    assert(actual: parkingSystem.currentAvailableSpots(), expected: 998)
//    
//    // Vehicle one checkout and leaving the parking lot
//    let twoHours = now.addingTimeInterval(60*60*2)
//    let rev1 = parkingSystem.vehicleCheckout(licenseNumber: vehicleOne, outTime: twoHours)
//    assert(actual: rev1, expected: 0)
//    assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleOne), expected: true)
//    assert(actual: parkingSystem.currentAvailableSpots(), expected: 999)
//    
//    // Vehicle two trying to leave without paying
//    assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleTwo), expected: false)
//    
//    // Vehicle two checkout
//    let fiveHours = thirtyMinutesLater.addingTimeInterval(60*60*5)
//    let rev2 = parkingSystem.vehicleCheckout(licenseNumber: vehicleTwo, outTime: fiveHours)
//    // assert(actual: rev2, expected: 0) --> What should we expect?
//    
//    // Vehicle two leaving the parking lot
//    assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleTwo), expected: true)
//    assert(actual: parkingSystem.currentAvailableSpots(), expected: 1000)
//
//}
//
//

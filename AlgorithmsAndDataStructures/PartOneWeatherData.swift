//
//  PartOneWeatherData.swift
//  AlgorithmsAndDataStructures
//
//  Created by Jim Wilson on 5/2/17.
//  Copyright © 2017 Jim Danger, LLC. All rights reserved.
//

class PartOneWeatherData {
    
    /*
     Instructions for this Kata: 
     
     In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002.
     Download this text file, then write a program to output the day number (column one)
     with the smallest temperature spread (the maximum temperature is the second column,
     the minimum the third column).
    
    */
    
    
    func doTheKata() {
        print(calculateDateOfSmallestTemperatureSpread())
    }

    
    func calculateDateOfSmallestTemperatureSpread() -> Int {
        
        guard let dataString = getStringFromDatFile(fileName: "weather", fileExtention: "dat") else {
            return -1
        }
        
        let arrayOfRows: [String] = makeStringIntoArrayOfRows(string: dataString)
        
        let days: [Kata04Day] = createDaysFromData(stringArrayOfEachRow: arrayOfRows)
        
        guard let dayToReturn: Int = findDayWithSmallestTempRange(days: days)?.day else {
            return -1
        }
    
        return dayToReturn
    }
    
    func getStringFromDatFile(fileName: String, fileExtention: String) -> String? {
    
        let fileReader: KataFileReader = KataFileReader()
        
        var weatherDataString: String?
        do {
            try weatherDataString = fileReader.readFile(fileName: fileName, fileExtention: fileExtention)
            
        } catch Kata04Errors.cannotReadFile {
            return nil
            
        } catch Kata04Errors.fileNotFound {
            return nil
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return weatherDataString
    }
    
    func makeStringIntoArrayOfRows(string: String) -> [String] {
        return string.components(separatedBy: "\n")
    }
    
    func createDaysFromData(stringArrayOfEachRow: [String]) -> [Kata04Day] {
        
        let headerRow = stringArrayOfEachRow[0]
        var days: [Kata04Day] = []
        
        var wasLastCharSpace = false
       
        for row in 2..<stringArrayOfEachRow.count-2 { // skip the first and last 2 rows.
        
            var date: String?
            var max: String?
            var min: String?
            
            for (index, character) in headerRow.characters.enumerated() {
            
                var header = ""
                
                if character != " " {
                    if wasLastCharSpace {
                        header = getNextItemFromStringStartingAtLocation(string: headerRow, startingLocation: index)
                        switch header {
                        case "Dy":
                            date = getNextItemFromStringStartingAtLocation(string: stringArrayOfEachRow[row], startingLocation: index)
                            break
                        case "MxT":
                            max = getNextItemFromStringStartingAtLocation(string: stringArrayOfEachRow[row], startingLocation: index)
                            break
                        case "MnT":
                            min = getNextItemFromStringStartingAtLocation(string: stringArrayOfEachRow[row], startingLocation: index)
                            break
                        default:
                            break
                        }
                    }
                    wasLastCharSpace = false
                } else {
                    wasLastCharSpace = true
                }
            }
         
            if let unwrappedDate = date, let unwrappedMax = max, let unwrappedMin = min {
                if let dateAsInt = Int(unwrappedDate) {
                    let day: Kata04Day = Kata04Day(day: dateAsInt, maxTemp: unwrappedMax, minTemp: unwrappedMin)
                    days.append(day)
                }
            }
        }
        return days
    }
    
    func getNextItemFromStringStartingAtLocation(string: String, startingLocation: Int ) -> String {
        var item: String = ""
        var hasAppendedNonSpaceCharToItem = false
        
        for (index, character) in string.characters.enumerated() {
           
            if index >= startingLocation {
                if character == " " && !hasAppendedNonSpaceCharToItem {
                     // do nothing; this is a leading space.
                } else if character != " " {
                    item.append(character)
                    hasAppendedNonSpaceCharToItem = true
                } else if character == " " && hasAppendedNonSpaceCharToItem {
                   return item
                }
            }
        }
        return item
    }
    
    
    func findDayWithSmallestTempRange(days: [Kata04Day]) -> Kata04Day? {
        
        if days.isEmpty {
            return nil
        }

        // starting values of the first day of the month.
        var smallestTempRange: Int = days[0].maxTemp.temp - days[0].minTemp.temp
        var dayWithSmallestTempRange: Kata04Day = days[0]
        
        for day in days {
            let tempRange = day.maxTemp.temp - day.minTemp.temp
            print("day \(day.day)")
            print(tempRange)
            
            if tempRange < smallestTempRange {
                smallestTempRange = tempRange
                dayWithSmallestTempRange = day
            }
        }
        return dayWithSmallestTempRange
    }
}

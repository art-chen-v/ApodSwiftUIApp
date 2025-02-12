//
//  Helpers.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/12/25.
//

import Foundation

enum DateError: Error {
    case invalidDateCalculation
}

extension Date {
    func minusDays(_ days: Int) throws -> Date {
        let calendar = Calendar.current

        guard let newDate = calendar.date(byAdding: .day, value: -days, to: self) else {
            throw DateError.invalidDateCalculation
        }
        
        return newDate
    }
}

var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    return dateFormatter
}()

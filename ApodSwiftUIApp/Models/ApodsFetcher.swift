//
//  ApodsFetcher.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import Foundation


actor ApodsFetcher {
    var latestDate: Date?
    let apiClient: ApodClient
    
    func fetchApods(for numberOfDays: Int) async throws -> [Apod] {
        let laterDate: Date
        
        if let date = latestDate {
            laterDate = date
        } else {
            let latestApod = try await apiClient.fetchLatestApod()
            laterDate = latestApod.date
        }
                
        let earlierDate = try laterDate.minusDays(numberOfDays)
        try updateLatestDate(earlierDate)
        let apods = try await apiClient.fetchApods(from: earlierDate, to: laterDate)
        return apods
    }
    
    private func fetchApods(from laterDate: Date, for numberOfDays: Int) async throws -> [Apod] {
        let earlierDate = try laterDate.minusDays(numberOfDays)
        try updateLatestDate(earlierDate)
        let apods = try await apiClient.fetchApods(from: earlierDate, to: laterDate)
        return apods
    }
    
    private func updateLatestDate(_ date: Date) throws {
        self.latestDate = try date.minusDays(1)
    }
    
    init(apiClient: ApodClient = ApodClient(), latestDate: Date? = nil) {
        self.apiClient = apiClient
        self.latestDate = latestDate
    }
}

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

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
    
    private func updateLatestDate(_ date: Date) throws {
        self.latestDate = try date.minusDays(1)
    }
    
    init(apiClient: ApodClient = ApodClient(), latestDate: Date? = nil) {
        self.apiClient = apiClient
        self.latestDate = latestDate
    }
}

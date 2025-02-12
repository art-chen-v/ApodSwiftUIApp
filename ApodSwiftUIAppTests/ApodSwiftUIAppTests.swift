//
//  ApodSwiftUIAppTests.swift
//  ApodSwiftUIAppTests
//
//  Created by Artem Chen on 2/5/25.
//

import XCTest
@testable import ApodSwiftUIApp

final class ApodSwiftUIAppTests: XCTestCase {
    
    func testApiClientDoesFetchSingleApodData() async throws {
        let apiClient = ApodClient(downloader: TestDownloader())
        let apod = try await apiClient.fetchLatestApod()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = dateFormatter.date(from: "2025-02-11") {
            XCTAssertEqual(apod.date, date)
        } else {
            XCTFail()
        }
    }
    
    func testApiClientDoesFetchMultipleApodData() async throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let apiClient = ApodClient(downloader: TestDownloader())
        
        if let earlierDate = dateFormatter.date(from: "2025-02-01"),
            let laterDate = dateFormatter.date(from: "2025-02-11") {
            let apods = try await apiClient.fetchApods(from: earlierDate, to: laterDate)
            XCTAssertEqual(apods.count, 11)
        } else {
            XCTFail()
        }
    }
    
}

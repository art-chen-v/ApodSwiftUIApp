//
//  TestDownloader.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/12/25.
//

import Foundation

struct TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        if let query = url.query() {
            if query.contains("end_date") && query.contains("start_date") {
                try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
                return testApodsData
            } else {
                try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
                return testSingleApodData
            }
        } else {
            throw URLError(.badURL)
        }
    }
}

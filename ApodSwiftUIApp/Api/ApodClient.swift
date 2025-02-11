//
//  ApodClient.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/9/25.
//

import Foundation

actor ApodClient {
    
    private let downloader: any HTTPDataDownloader
    
    private let baseURL = "https://api.nasa.gov/planetary/apod"

    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        return aDecoder
    }()
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
    
    func fetchLatestApod() async throws -> Apod {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        let data = try await downloader.httpData(from: url)
        let apods = try decoder.decode([Apod].self, from: data)
        guard let latestApod = apods.first else {
            throw ApodError.missingData
        }
        return latestApod
    }
    
    func fetchApods(from earlierDate: Date, to latestDate: Date) async throws -> [Apod] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let earlierDateStr = dateFormatter.string(from: earlierDate)
        let latestDateStr = dateFormatter.string(from: latestDate)
        
        let parameters: [String: String] = [
            "api_key": apiKey,
            "start_date": earlierDateStr,
            "end_date": latestDateStr
        ]
        
        urlComponents.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let data = try await downloader.httpData(from: url)
        
        let apods = try decoder.decode([Apod].self, from: data)
        
        return apods
    }
}

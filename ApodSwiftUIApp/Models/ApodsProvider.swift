//
//  ApodsProvider.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import Foundation

@MainActor
class ApodsProvider: ObservableObject {
    
    @Published var apods: [Apod] = []
    
    private let apiClient: ApodClient
    private var apodsFetcher: ApodsFetcher
    
    init(apiClient: ApodClient = ApodClient(), apodsFetcher: ApodsFetcher = ApodsFetcher()) {
        self.apiClient = apiClient
        self.apodsFetcher = apodsFetcher
    }
    
    func fetchApods() async throws {
        let fetchedApods = try await apodsFetcher.fetchApods(for: 10)
        apods.append(contentsOf: fetchedApods)
    }
}

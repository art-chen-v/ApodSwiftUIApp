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
    
    private var apodsFetcher: ApodsFetcher
    
    init(apodsFetcher: ApodsFetcher = ApodsFetcher()) {
        self.apodsFetcher = apodsFetcher
    }
    
    func fetchApods() async throws {
        let fetchedApods = try await apodsFetcher.fetchApods(for: 10)
        apods.append(contentsOf: fetchedApods)
    }
}

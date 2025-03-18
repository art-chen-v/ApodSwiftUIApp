//
//  NetworkMonitor.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 3/18/25.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    
    @Published var hasNetworkConnection: Bool = true
    
    private let networkMonitor = NWPathMonitor()
    
    init() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            self?.hasNetworkConnection = path.status == .satisfied
        }
        
        networkMonitor.start(queue: DispatchQueue.global())
    }
}

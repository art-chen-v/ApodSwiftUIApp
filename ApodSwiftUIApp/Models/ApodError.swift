//
//  ApodError.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/7/25.
//

import Foundation

enum ApodError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension ApodError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Discarding apod missing title, explanation, date, or url.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching apod data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}

//
//  Apod.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/6/25.
//

import Foundation

struct Apod {
    let copyright: String?
    let date: Date
    let explanation: String
    let hdUrl: URL?
    let mediaType: String?
    let serviceVersion: String?
    let title: String
    let url: URL
}

extension Apod: Identifiable {
    var id: Date { date }
}

extension Apod: Equatable {
}

extension Apod: Decodable {
    private enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawCopyright = try? values.decode(String.self, forKey: .copyright)
        let rawDate = try? values.decode(Date.self, forKey: .date)
        let rawExplanation = try? values.decode(String.self, forKey: .explanation)
        let rawHdUrl = try? values.decode(URL.self, forKey: .hdUrl)
        let rawMediaType = try? values.decode(String.self, forKey: .mediaType)
        let rawServiceVersion = try? values.decode(String.self, forKey: .serviceVersion)
        let rawTitle = try? values.decode(String.self, forKey: .title)
        let rawUrl = try? values.decode(URL.self, forKey: .url)
        
        guard let date = rawDate,
              let explanation = rawExplanation,
              let title = rawTitle,
              let url = rawUrl
        else {
            throw ApodError.missingData
        }
        
        self.copyright = rawCopyright?.replacingOccurrences(of: "\n", with: "")
        self.date = date
        self.explanation = explanation
        self.hdUrl = rawHdUrl
        self.mediaType = rawMediaType
        self.serviceVersion = rawServiceVersion
        self.title = title
        self.url = url
    }
}

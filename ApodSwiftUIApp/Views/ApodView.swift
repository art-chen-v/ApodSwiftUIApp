//
//  ApodView.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 3/14/25.
//

import SwiftUI

struct ApodView: View {
    let apod: Apod
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ApodCell(apod: apod, isHeader: true)
                Group {
                    if let copyright = apod.copyright {
                        Text(copyright)
                            .font(.callout)
                    }
                    Text(apod.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.title2)
                        .fontWeight(.medium)
                    if let title = apod.title {
                        Text(title)
                            .font(.headline)
                    }
                    if let descr = apod.explanation {
                        Text(descr)
                    }
                }
                .padding(.horizontal, 8)
            }
            .toolbar {
                if let url = apod.hdUrl {
                    ShareLink(item: url)
                }
            }
        }
    }
}

#Preview {
//    ApodView()
}

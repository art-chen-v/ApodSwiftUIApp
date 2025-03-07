//
//  ApodsLazyList.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import SwiftUI

struct ApodsLazyList: View {
    @StateObject var apodsProvider = ApodsProvider()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(apodsProvider.apods) { item in
                        ApodCell(apod: item)
                    }
                }
            }
        }
        .task {
            try? await apodsProvider.fetchApods()
        }
    }
}

#Preview {
    let apiClient = ApodClient(downloader: TestDownloader())
    let apodsFetcher = ApodsFetcher(apiClient: apiClient)
    let apodsProvider = ApodsProvider(apodsFetcher: apodsFetcher)
    ApodsLazyList(apodsProvider: apodsProvider)
}

//
//  ApodsLazyList.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import SwiftUI

struct ApodsLazyList: View {
    @StateObject var apodsProvider = ApodsProvider()
    
    var body: some View {
        NavigationStack {
            
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

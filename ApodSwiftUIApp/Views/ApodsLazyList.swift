//
//  ApodsLazyList.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self.background(alignment: .center) {
            GeometryReader { geo in
                Color.clear
                    .preference(key: OffsetPreferenceKey.self, value: geo.frame(in: .global).maxY)
                    .onPreferenceChange(OffsetPreferenceKey.self, perform: { value in
                        action(value)
                    })
            }
        }
    }
}

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

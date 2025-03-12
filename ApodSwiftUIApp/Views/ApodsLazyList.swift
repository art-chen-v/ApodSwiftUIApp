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
    
    @State private var isLoadingMore: Bool = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            GeometryReader { scrollViewGeo in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(apodsProvider.apods) { item in
                            ApodCell(apod: item)
                                .onOffsetChanged { value in
                                    loadMoreIfNeeded(currentItem: item, lastItemMaxY: value,
                                                                scrollViewMaxY: scrollViewGeo.frame(in: .global).maxY)
                                }
                        }
                    }
                    if isLoadingMore {
                        ProgressView("Loading more...")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .padding(.vertical)
                    }
                }
            }
        }
        .task {
            try? await apodsProvider.fetchApods()
        }
    }
    
    private func loadMoreIfNeeded(currentItem: Apod,
                                  lastItemMaxY: CGFloat,
                                  scrollViewMaxY: CGFloat) {
        if currentItem == self.apodsProvider.apods.last {
            if lastItemMaxY - 100 < scrollViewMaxY {
                if !isLoadingMore {
                    isLoadingMore = true
                    Task {
                        try? await apodsProvider.fetchApods()
                        isLoadingMore = false
                    }
                }
            }
        }
    }
}

#Preview {
    let apiClient = ApodClient(downloader: TestDownloader())
    let apodsFetcher = ApodsFetcher(apiClient: apiClient)
    let apodsProvider = ApodsProvider(apodsFetcher: apodsFetcher)
    ApodsLazyList(apodsProvider: apodsProvider)
}

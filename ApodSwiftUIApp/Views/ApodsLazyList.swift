//
//  ApodsLazyList.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/11/25.
//

import SwiftUI

var lastValue: CGFloat = 0

struct OffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onOffsetChanged(isLastItem: Bool, action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self.background(alignment: .center) {
            if isLastItem {
                GeometryReader { geo in
                    Color.clear
                        .preference(key: OffsetPreferenceKey.self, value: geo.frame(in: .global).maxY)
                        .onPreferenceChange(OffsetPreferenceKey.self, perform: { value in
                            if abs(lastValue - value) > 100 {
                                lastValue = value
                                action(value)
                            }
                        })
                }
            }
        }
    }
}

struct ApodsLazyList: View {
    @StateObject var apodsProvider = ApodsProvider()
    @StateObject var networkMonitor = NetworkMonitor()
    
    @State private var isLoadMore: Bool = false
    @State private var isLoadMoreFailed: Bool = false
    @State private var isPagingMode = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            GeometryReader { scrollViewGeo in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(apodsProvider.apods) { item in
                            NavigationLink(destination: ApodView(apod: item)) {
                                ApodCell(apod: item)
                                    .onOffsetChanged(isLastItem: item == apodsProvider.apods.last) { value in
                                        Task {
                                            await loadMoreIfNeeded(currentItem: item, lastItemMaxY: value,
                                                                        scrollViewMaxY: scrollViewGeo.frame(in: .global).maxY)
                                        }
                                    }
                            }
                        }
                    }
                    .navigationTitle("Apods")
                    if isPagingMode {
                        if isLoadMoreFailed {
                            Button("", systemImage: "arrow.trianglehead.clockwise") {
                                Task {
                                    await loadData()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .padding()
                            .onChange(of: networkMonitor.hasNetworkConnection) { newValue in
                                if newValue {
                                    Task {
                                        await loadData()
                                    }
                                }
                            }
                        }
                        if isLoadMore {
                            ProgressView("Loading more...")
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .padding(.vertical)
                        }
                    }
                }
                .overlay(alignment: .center) {
                    if !isPagingMode {
                        if isLoadMoreFailed {
                            Button("", systemImage: "arrow.trianglehead.clockwise") {
                                Task {
                                    await loadData()
                                }
                            }
                        }
                        if isLoadMore {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }

                }
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        do {
            isLoadMore = true
            isLoadMoreFailed = false
            try await apodsProvider.fetchApods()
            isLoadMore = false
            isPagingMode = true
        } catch {
            isLoadMore = false
            isLoadMoreFailed = true
        }
    }
    
    private func loadMoreIfNeeded(currentItem: Apod,
                                  lastItemMaxY: CGFloat,
                                  scrollViewMaxY: CGFloat) async {
        if lastItemMaxY - 100 < scrollViewMaxY {
            if !isLoadMore && !isLoadMoreFailed {
                await loadData()
            }
        }
    }
}

#Preview {
    ApodsLazyList(apodsProvider: ApodsProvider())
}

//
//  ApodViewHeader.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 3/17/25.
//

import SwiftUI

struct ApodViewHeader: View {
    let apod: Apod
    
    var body: some View {
        AsyncImage(url: apod.url) { image in
            Rectangle()
                .overlay {
                    image
                        .resizable()
                        .scaledToFill()
                }
                .clipped()
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .aspectRatio(4/3, contentMode: .fill)
    }
}

#Preview {
//    ApodViewHeader()
}

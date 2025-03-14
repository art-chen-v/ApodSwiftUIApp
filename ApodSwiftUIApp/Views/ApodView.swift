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
            VStack {
                ApodCell(apod: apod)
            }
        }
    }
}

#Preview {
//    ApodView()
}

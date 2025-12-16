//
//  ContentView.swift
//  Instafilter
//
//  Created by Ihor Sukhachov on 16.12.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
    var body: some View {
        VStack {
            Text("Hey het")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) {oldValue, newValue in
                    print("New blur amount: \(newValue)")
                    
                }
            Button("Random blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView()
}

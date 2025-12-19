//
//  ContentView.swift
//  Instafilter
//
//  Created by Ihor Sukhachov on 16.12.2025.
//

import SwiftUI


struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to add an image "))
                }
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change filter") {
                        //some code later
                    }
                    
                    Spacer()
                    
                }
            }.padding([.horizontal, .bottom])
                .navigationTitle("Instafilter ")
        }
        
        
    }
    
}

#Preview {
    ContentView()
}

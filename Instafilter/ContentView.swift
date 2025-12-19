//
//  ContentView.swift
//  Instafilter
//
//  Created by Ihor Sukhachov on 16.12.2025.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem:  PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to add an image "))
                    }
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    
                    Spacer()
                    
                }
            }.padding([.horizontal, .bottom])
                .navigationTitle("Instafilter ")
        }
        
        
    }
    func changeFilter() {
         
    }
}

#Preview {
    ContentView()
}

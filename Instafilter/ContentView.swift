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
        VStack {
            Spacer()
            
            //image  area
            
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
        
        
    }
    
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Instafilter
//
//  Created by Ihor Sukhachov on 16.12.2025.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI


struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem:  PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilters: Bool = false
    
    let context = CIContext()
    
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
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    
                    Spacer()
                    
                }
            }.padding([.horizontal, .bottom])
                .navigationTitle("Instafilter")
                .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                    Button("Crystallize") {setFilter(CIFilter.crystallize())}
                    Button("Edges") {setFilter(CIFilter.edges())}
                    Button("Gaussian blur") {setFilter(CIFilter.gaussianBlur())}
                    Button("Pixellate") {setFilter(CIFilter.pixellate())}
                    Button("Sepia tone") {setFilter(CIFilter.sepiaTone())}
                    Button("Unsharp mask") {setFilter(CIFilter.unsharpMask())}
                    Button("Vignette") {setFilter(CIFilter.vignette())}
                    Button("Cancel", role: .cancel) {}
                }
            
        }
        
        
    }
    func changeFilter() {
         showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing(){
        currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        //currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
        
        
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

#Preview {
    ContentView()
}
 

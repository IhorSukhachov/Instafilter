//
//  ContentView.swift
//  Instafilter
//
//  Created by Ihor Sukhachov on 16.12.2025.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI

struct ContentView: View {
//    @State private var blurAmount = 0.0
//    @State private var showingConfirmation: Bool = false
//    @State private var backgroundColor: Color = .white
   //  @State private var image: Image?
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 6, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            ScrollView {
                ForEach(0..<selectedImages.count, id:\.self)  {i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
            ShareLink(item: URL(string: "google.com")!)
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
//        VStack {
//            Text("Hey het")
//                .blur(radius: blurAmount)
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) {oldValue, newValue in
//                    print("New blur amount: \(newValue)")
//                    
//                }
//            Button("Random blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//            
//            Button("Confirmation") {
//                showingConfirmation.toggle()
//            }
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
//                Button("Red") { backgroundColor = .red }
//                Button("Green") { backgroundColor = .green}
//                Button("Blue") { backgroundColor = .blue }
//                Button("Cancel", role: .cancel) { }
//            } message: {
//                Text("Select a color")
//            }
//        }
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
        
        
     //   ContentUnavailableView("No content to show", systemImage: "swift")
        
        
        
    }
//    func loadImage() {
//        let inputImage = UIImage(resource: .example)
//        let beginImage = CIImage(image: inputImage)
//        
//        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
//        
//        guard let outputImage = currentFilter.outputImage else { return }
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
//        
//        let uiImage = UIImage(cgImage: cgImage)
//        
//        image = Image(uiImage: uiImage)
//        
//        
//        
//        
//    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  photopicker_in_swiftui
//
//  Created by Vandad Nahavandipoor on 2022-10-03.
//

import SwiftUI

// #docregion PhotoPickerViewExample
import PhotosUI

struct ContentView: View {
  
  @State private var isPresented = false
  @State private var image: UIImage?
  
  var body: some View {
    VStack {
      Button("Display photo picker") {
        isPresented.toggle()
      }.sheet(isPresented: $isPresented) {
        let conf = PHPickerConfiguration(
          photoLibrary: PHPhotoLibrary.shared()
        )
        PhotoPicker(
          conf: conf,
          isPresented: $isPresented,
          image: $image
        )
      }
      if image != nil {
        Image(uiImage: image!)
          .resizable()
          .frame(maxWidth: 200, maxHeight: 200)
      }
    }
  }
}
// #enddocregion PhotoPickerViewExample

// #docregion PhotoPickerExample
struct PhotoPicker: UIViewControllerRepresentable {
  
  let conf: PHPickerConfiguration
  @Binding var isPresented: Bool
  @Binding var image: UIImage?
  
  func makeUIViewController(
    context: Context
  ) -> UIViewController {
    let controller = PHPickerViewController(
      configuration: conf
    )
    controller.delegate = context.coordinator
    return controller
  }
  
  func updateUIViewController(
    _ uiViewController: UIViewController,
    context: Context
  ) {
    // empty for now
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: PHPickerViewControllerDelegate {
    private let parent: PhotoPicker
    
    init(
      _ parent: PhotoPicker
    ) {
      self.parent = parent
    }
    
    func picker(
      _ picker: PHPickerViewController,
      didFinishPicking results: [PHPickerResult]
    ) {
      self.parent.isPresented = false
      guard let provider = results.first?.itemProvider else {
        return
      }
      if provider.canLoadObject(ofClass: UIImage.self) {
        provider.loadObject(ofClass: UIImage.self) { image, _ in
          self.parent.image = image as? UIImage
        }
      }
    }
  }
  
}
// #enddocregion PhotoPickerExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}

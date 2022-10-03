//
//  ContentView.swift
//  photopicker_in_swiftui
//
//  Created by Vandad Nahavandipoor on 2022-10-03.
//

import SwiftUI

// #docregion CameraViewExample
struct ContentView: View {
  
  @State private var isPresented = false
  @State private var image: Image?
  
  var body: some View {
    VStack {
      Button("Display camera picker") {
        isPresented.toggle()
      }.sheet(isPresented: $isPresented) {
        CameraPicker(
          isPresented: $isPresented,
          image: $image
        )
      }
      if image != nil {
        image!
          .resizable()
          .frame(maxWidth: 200, maxHeight: 200)
      }
    }
  }
}
// #enddocregion CameraViewExample

// #docregion CameraPickerExample
struct CameraPicker: UIViewControllerRepresentable {
  
  @Binding var isPresented: Bool
  @Binding var image: Image?
  
  func updateUIViewController(
    _ uiViewController: UIImagePickerController,
    context: Context
  ) {
    // empty for now
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(
      isPresented: $isPresented,
      image: $image
    )
  }
  
  enum Errors: Error {
    case noCameraAccess
  }
  
  func makeUIViewController(
    context: Context
  ) -> UIImagePickerController {
    let controller = UIImagePickerController()
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      controller.sourceType = .camera
    }
    controller.delegate = context.coordinator
    return controller
  }
  
  class Coordinator: NSObject,
                     UINavigationControllerDelegate,
                     UIImagePickerControllerDelegate {
    
    @Binding var isPresented: Bool
    @Binding var image: Image?
    
    init(
      isPresented: Binding<Bool>,
      image: Binding<Image?>
    ) {
      self._isPresented = isPresented
      self._image = image
    }
    
    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
      defer {
        isPresented = false
      }
      guard let uiImage = info[
        UIImagePickerController.InfoKey.originalImage
      ] as? UIImage else {
        return
      }
      self.image = Image(uiImage: uiImage)
    }
    
    func imagePickerControllerDidCancel(
      _ picker: UIImagePickerController
    ) {
      isPresented = false
    }
    
  }
  
}
// #enddocregion CameraPickerExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}

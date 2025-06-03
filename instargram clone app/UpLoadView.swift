//
//  SwiftUIView.swift
//  instargram clone app
//
//  Created by jsy on 6/2/25.
//

import SwiftUI

struct UpLoadView: View {
    @State private var openPhoto = false
    @State private var image = UIImage()

    var body: some View {
        VStack {
            Text("Select File")
                .font(.title)

            if image.size.width != 0 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            }

            Button(action: {
                self.openPhoto = true
            }) {
                Text("file...")
                    .padding()
            }
        }
        .sheet(isPresented: $openPhoto) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

#Preview {
    UpLoadView()
}

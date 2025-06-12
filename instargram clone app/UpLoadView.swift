import SwiftUI

struct UpLoadView: View {
    @ObservedObject var viewModel = CameraViewModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let isDarkMode = colorScheme == .dark
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear {
                    viewModel.configure()
                }
            
            VStack {
                Spacer()                                                                               
                HStack{
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    Spacer()
                    Button(action: {viewModel.capturePhoto()}) {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    Spacer()
                    Button(action: {viewModel.changeCamera()}) {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .frame(width: 75, height: 75)
                    .padding()
                }
            }
            .foregroundColor(.black)
        }
    }
}

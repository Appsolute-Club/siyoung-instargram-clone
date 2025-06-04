import SwiftUI

struct UpLoadView: View {
    @ObservedObject var viewModel = CameraViewModel()

    var body: some View {
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
                    }
                    Spacer()
                    Button(action: {viewModel.capturePhoto()}) {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                    }
                    Spacer()
                    Button(action: {viewModel.changeCamera()}) {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .frame(width: 75, height: 75)
                    .padding()
                }
            }
            .foregroundColor(.black)
        }
    }
}

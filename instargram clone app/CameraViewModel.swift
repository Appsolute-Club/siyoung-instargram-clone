//
//  CameraViewModel.swift
//  instargram clone app
//
//  Created by jsy on 6/4/25.
//


import SwiftUI
import AVFoundation
import AudioToolbox

class CameraViewModel: NSObject, ObservableObject {
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    @Published var cameraPreview: AnyView = AnyView(Text("카메라 미리보기"))

    private let session = AVCaptureSession()
    private var photoOutput = AVCapturePhotoOutput()
    private var videoDeviceInput: AVCaptureDeviceInput?

    override init() {
        super.init()
        self.cameraPreview = AnyView(CameraPreviewView(session: session))
    }

    func configure() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    self.setupSession()
                    self.session.startRunning()
                } else {
                    print("카메라 권한이 없습니다.")
                }
            }
        }
    }

    func setupSession() {
        session.beginConfiguration()
        session.sessionPreset = .photo

        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: camera),
              session.canAddInput(input) else {
            print("카메라 입력 추가 실패")
            return
        }

        session.addInput(input)
        videoDeviceInput = input

        if session.canAddOutput(photoOutput) {
            session.addOutput(photoOutput)
        }

        session.commitConfiguration()
    }

    func switchFlash() {
        isFlashOn.toggle()
    }

    func switchSilent() {
        isSilentModeOn.toggle()
    }

    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = isFlashOn ? .on : .off
        photoOutput.capturePhoto(with: settings, delegate: self)
    }

    func changeCamera() {
        guard let currentInput = videoDeviceInput else { return }

        session.beginConfiguration()
        session.removeInput(currentInput)

        let newPosition: AVCaptureDevice.Position = (currentInput.device.position == .back) ? .front : .back

        if let newDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: newPosition),
           let newInput = try? AVCaptureDeviceInput(device: newDevice) {
            if session.canAddInput(newInput) {
                session.addInput(newInput)
                videoDeviceInput = newInput
            }
        }

        session.commitConfiguration()
    }
}

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        if let error = error {
            print("사진 캡처 실패: \(error.localizedDescription)")
            return
        }

        if !isSilentModeOn {
            AudioServicesPlaySystemSound(1108)
        }

        guard let _ = photo.fileDataRepresentation() else { return }

        print("사진 캡처 성공!")
    }
}

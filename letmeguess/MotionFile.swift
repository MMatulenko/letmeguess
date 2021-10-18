//
//  MotionFile.swift
//  letmeguess
//
//  Created by Maksims Matulenko on 18/10/2021.
//

import Foundation
import SwiftUI
import Combine

let messagePublisher = PassthroughSubject<Void, Never>()

class ShakableViewController: UIViewController {

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        messagePublisher.send()
    }
}

struct ShakableViewRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController()
    }
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {
        
    }
}

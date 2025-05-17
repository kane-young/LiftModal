//
//  SwiftUIHostingController.swift
//  LiftModalSample
//
//  Created by 이영우 on 5/11/25.
//

import SwiftUI
import UIKit

import LiftModal

/// A sample ViewController that demonstrates presenting a modal view.
final class SwiftUIHostingController: UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let hostingController = UIHostingController(rootView: ContentView())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        view.backgroundColor = .white
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}

private struct ContentView: View {
    @State private var isShowModal = false

    var body: some View {
        VStack {
            Button(action: {
                isShowModal = true
            }, label: {
                Text("Show Modal Button")
            })
        }
        .ignoresSafeArea()
        .showModal(isShow: $isShowModal,
                   content: ModalContentView())
    }
}

//
//  LiftModalHostingController.swift
//
//
//  Created by 이영우 on 5/10/25.
//

import Combine
import SwiftUI
import UIKit

public final class LiftModalHostingController<Content: View>: UIViewController {
    private let configuration: ModalConfiguration
    private let content: Content
    private var isPresented: Bool = true

    public init(configuration: ModalConfiguration = .default,
                content: Content) {
        self.configuration = configuration
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let rootView = LiftModalWrapperView(
            isPresented: Binding(get: {
                return self.isPresented
            }, set: { newValue in
                self.isPresented = newValue
            }),
            content: content,
            configuration: configuration,
            dismissAction: {
                self.dismiss(animated: false)
            })
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        view.backgroundColor = .clear
        hostingController.view.backgroundColor = .clear
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

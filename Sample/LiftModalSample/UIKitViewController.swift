//
//  UIKitViewController.swift
//  LiftModalSample
//
//  Created by 이영우 on 5/3/25.
//

import UIKit

import LiftModal

/// A sample ViewController that demonstrates presenting a modal view.
final class UIKitViewController: UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.setTitle("Show Modal Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        let modalHostingController = LiftModalHostingController(content: ModalContentView())
        self.presentModal(modalHostingController)
    }
}

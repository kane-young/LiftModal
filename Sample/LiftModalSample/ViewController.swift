//
//  ViewController.swift
//  LiftModalSample
//
//  Created by 이영우 on 5/3/25.
//

import SwiftUI
import UIKit

import LiftModal

class ViewController: UIViewController {

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
        let modalHostingController = LiftModalHostingController(content: ContentView())
        self.presentModal(modalHostingController)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("11111")
            Text("22222")
            Text("3333")
            Text("44444")
            Text("55555")
        }
    }
}

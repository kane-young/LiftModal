//
//  ViewController.swift
//  LiftModalSample
//
//  Created by 이영우 on 5/3/25.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        button.setTitle("눌러", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() { }
}

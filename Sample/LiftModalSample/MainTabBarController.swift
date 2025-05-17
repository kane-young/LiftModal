//
//  MainTabBarController.swift
//  LiftModalSample
//
//  Created by 이영우 on 5/11/25.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let uikitVC = UINavigationController(rootViewController: UIKitViewController())
        uikitVC.tabBarItem = UITabBarItem(title: "UIKit Example",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))

        let swiftuiVC = UINavigationController(rootViewController: SwiftUIHostingController())
        swiftuiVC.tabBarItem = UITabBarItem(title: "SwiftUI Example",
                                           image: UIImage(systemName: "magnifyingglass"),
                                           selectedImage: UIImage(systemName: "magnifyingglass"))

        viewControllers = [uikitVC, swiftuiVC]
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
    }
}

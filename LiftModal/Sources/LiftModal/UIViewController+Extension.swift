//
//  UIViewController+Extension.swift
//  
//
//  Created by 이영우 on 5/10/25.
//

import UIKit

public extension UIViewController {
    func presentModal(_ viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .overFullScreen
        present(viewControllerToPresent, animated: false, completion: completion)
    }
}

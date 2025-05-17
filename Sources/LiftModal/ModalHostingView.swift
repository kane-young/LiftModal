//
//  ModalHostingView.swift
//
//
//  Created by 이영우 on 5/11/25.
//

import SwiftUI
import UIKit

public struct ModalHostingView<PresentedView>: UIViewRepresentable where PresentedView: View {

    @Binding var isPresented: Bool

    let configuration: ModalConfiguration
    let onDismiss: () -> Void
    let content: PresentedView

    init(isPresented: Binding<Bool>,
         configuration: ModalConfiguration,
         onDismiss: @escaping () -> Void,
         content: PresentedView) {
        self._isPresented = isPresented
        self.configuration = configuration
        self.onDismiss = onDismiss
        self.content = content
    }

    public final class Coordinator {
        private let parent: ModalHostingView
        weak var presentedController: LiftModalHostingController<PresentedView>?

        init(_ parent: ModalHostingView) {
            self.parent = parent
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    public func makeUIView(context: Context) -> UIView {
        return UIView()
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        if isPresented {
            if let hostingController = uiView.findViewController(),
               hostingController.presentedViewController == nil {
                let viewController = LiftModalHostingController(
                    configuration: .default,
                    content: content) {
                        self.isPresented = false
                    }
                viewController.modalPresentationStyle = .overFullScreen
                context.coordinator.presentedController = viewController
                hostingController.present(viewController, animated: false)
            }
        } else {
            context.coordinator.presentedController?.dismiss(animated: false)
        }
    }
}

private extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
}

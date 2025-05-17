//
//  View+Extension.swift
//  
//
//  Created by 이영우 on 5/10/25.
//

import SwiftUI

extension View {
    public func showModal<Content: View>(isShow: Binding<Bool>, content: Content) -> some View {
        modifier(ModalSheetViewModifier(isPresented: isShow,
                                        configuration: .default,
                                        content: content))
    }
}

struct ModalSheetViewModifier<SheetContent>: ViewModifier where SheetContent: View {
    let isPresented: Binding<Bool>
    let configuration: ModalConfiguration
    let contentView: SheetContent

    init(
        isPresented: Binding<Bool>,
        configuration: ModalConfiguration,
        content: SheetContent
    ) {
        self.isPresented = isPresented
        self.configuration = configuration
        self.contentView = content
    }

    func body(content: Content) -> some View {
        content
        .background(
            ModalHostingView(
                isPresented: isPresented,
                configuration: configuration,
                onDismiss: { },
                content: contentView)
        )
    }
}

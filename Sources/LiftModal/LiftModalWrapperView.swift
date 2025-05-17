//
//  LiftModalWrapperView.swift
//  
//
//  Created by 이영우 on 5/10/25.
//

import SwiftUI
import Combine

struct LiftModalWrapperView<Content: View>: View {

    @Binding var isPresented: Bool

    @State private var showModal = false
    @State private var dragOffset: CGFloat = 0
    @State private var modalHeight: CGFloat = 0

    private let content: Content
    private let configuration: ModalConfiguration
    private let dismissAction: () -> Void

    private var maxOffset: CGFloat {
        let offset = showModal ? 10 : modalHeight
        return offset + max(dragOffset, -20)
    }

    init(isPresented: Binding<Bool>,
         content: Content,
         configuration: ModalConfiguration = .default,
         dismissAction: @escaping () -> Void) {
        self._isPresented = isPresented
        self.content = content
        self.configuration = configuration
        self.dismissAction = dismissAction
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented {
                BackgroundDimmedView(
                    dimmedOpacity: configuration.dimmedOpacity) {
                        closeModal()
                    }
            }

            VStack {
                TopAreaDumpView(height: configuration.topPadding)
                content
                BottomSafeAreaDumpView()
            }
            .frame(maxWidth: .infinity)
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: configuration.cornerRadius))
            .offset(y: maxOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height > 0 {
                            dragOffset = value.translation.height
                        }
                    }
                    .onEnded { value in
                        let threshold = modalHeight * configuration.dismissRatio
                        if dragOffset > threshold {
                            closeModal()
                        } else {
                            withAnimation {
                                dragOffset = 0
                            }
                        }
                    }
            )
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            modalHeight = proxy.size.height
                        }
                        .onChange(of: proxy.size.height) { newValue in
                            withAnimation(.easeInOut(duration: 0.3)) {
                                modalHeight = newValue
                            }
                        }
                }
            )
            .onAppear {
                withAnimation(.spring(response: 0.3,
                                      dampingFraction: 0.8,
                                      blendDuration: 0)) {
                    showModal = true
                }
            }
        }
        .ignoresSafeArea()
    }

    /// Use this method for close animation
    private func closeModal() {
        withAnimation {
            showModal = false
            dragOffset = UIScreen.main.bounds.height
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
            dismissAction()
        }
    }
}

// MARK: - UI Components

extension LiftModalWrapperView {
    struct BackgroundDimmedView: View {
        let dimmedOpacity: Double
        let onTap: () -> Void

        var body: some View {
            Color.black.opacity(dimmedOpacity)
                .gesture(TapGesture().onEnded {
                    onTap()
                })
                .ignoresSafeArea()
        }
    }

    struct BottomSafeAreaDumpView: View {
        private let safeaAreaBottomHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0

        var body: some View {
            Spacer()
                .frame(height: safeaAreaBottomHeight)
        }
    }

    struct TopAreaDumpView: View {
        let height: CGFloat

        var body: some View {
            Spacer()
                .frame(height: height)
        }
    }
}

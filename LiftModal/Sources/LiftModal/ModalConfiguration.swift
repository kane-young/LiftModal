//
//  ModalConfiguration.swift
//
//
//  Created by 이영우 on 5/10/25.
//

import SwiftUI

public struct ModalConfiguration {

    static let `default` = ModalConfiguration(topPadding: 16,
                                              dismissRatio: 0.3,
                                              cornerRadius: 16,
                                              dimmedOpacity: 0.3)

    /// Modal의 content가 들어가기 이전 위쪽에 Padding을 주는 정도
    public let topPadding: CGFloat
    /// Modal을 해당 비율만큼 Drag 했을 때 dismiss 처리
    public let dismissRatio: CGFloat
    /// Modal의 Round 정도
    public let cornerRadius: CGFloat
    /// Dimmed View Alpha 값
    public let dimmedOpacity: Double
}

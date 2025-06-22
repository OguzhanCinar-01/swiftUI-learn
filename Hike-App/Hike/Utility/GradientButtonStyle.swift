//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Oğuzhan Cnr on 19.10.2024.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Nil Coalescing
                // Condition ?A : B
                configuration.isPressed ?
                LinearGradient(colors: [
                    .customGrayMedium,
                    .customGrayLight
                ], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [
                .customGrayLight,
                .customGrayMedium
            ], startPoint: .top, endPoint: .bottom))
            .cornerRadius(40)
    }
}

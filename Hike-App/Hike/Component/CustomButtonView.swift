//
//  CustomButtonView.swift
//  Hike
//
//  Created by Oğuzhan Cnr on 19.10.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                 LinearGradient(
                    colors: [
                        .white,
                        .customGreenLight,
                        .customGreenDark],
                       startPoint: .top,
                       endPoint: .bottom)
                )
            Circle()
                .strokeBorder(LinearGradient(colors: [
                    .customGrayLight,
                    .customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                ,lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                        .customGrayLight,
                        .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
        .frame(width: 58, height: 58)
        
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}

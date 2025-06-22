//
//  CustomContentUnavailibleView.swift
//  Paws
//
//  Created by Oğuzhan Cnr on 17.06.2025.
//

import SwiftUI

struct CustomContentUnavailibleView: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
            
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.secondary)

    }
}

#Preview {
    CustomContentUnavailibleView(
        icon: "cat.circle",
        title: "No photo",
        description: "Add a photo to get started")
}

//
//  CustomListRow.swift
//  Hike
//
//  Created by Oğuzhan Cnr on 18.11.2024.
//

import SwiftUI

struct CustomListRow: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
            } else if (rowLinkLabel != nil &&
            rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string:
                    rowLinkDestination!)!)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        
                }
                Text(rowLabel)
            }
        }
        }
}

#Preview {
    List {
        CustomListRow(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
            
        )
    }
}

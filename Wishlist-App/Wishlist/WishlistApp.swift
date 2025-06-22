//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Oğuzhan Cnr on 18.02.2025.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}

//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Oğuzhan Cnr on 19.06.2025.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}

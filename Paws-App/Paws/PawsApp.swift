//
//  PawsApp.swift
//  Paws
//
//  Created by Oğuzhan Cnr on 17.06.2025.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}

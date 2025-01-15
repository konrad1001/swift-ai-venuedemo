//
//  VenueDemoApp.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

@main
struct VenueDemoApp: App {
    let venueManager: VenueManager
    let navigator: Navigator

    init() {
        let venueManager = VenueManager()
        let navigator = Navigator()

        venueManager.setUp()

        self.venueManager = venueManager
        self.navigator = navigator
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(venueManager)
        .environment(navigator)
    }
}

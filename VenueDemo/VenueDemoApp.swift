//
//  VenueDemoApp.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import AppIntents
import SwiftUI

@main
struct VenueDemoApp: App {
    let venueManager: VenueManager
    let navigator: Navigator

    init() {
        let venueManager = VenueManager()
        let navigator = Navigator()

        venueManager.setUp()

        AppDependencyManager.shared.add(dependency: venueManager)
        AppDependencyManager.shared.add(dependency: navigator)

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

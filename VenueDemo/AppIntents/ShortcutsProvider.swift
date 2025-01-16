//
//  ShortcutsProvider.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents

struct DiaryDemoShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: FilterVenuesIntent(),
                    phrases: ["Search \(.applicationName) by type"],
                    shortTitle: "Filter by Venue type",
                    systemImageName: "sparkles")
        AppShortcut(intent: SystemSearchIntent(),
                    phrases: ["Search \(.applicationName)"],
                    shortTitle: "Search for Venues",
                    systemImageName: "magnifyingglass")
    }
}

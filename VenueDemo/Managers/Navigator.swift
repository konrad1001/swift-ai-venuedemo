//
//  Navigator.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

@Observable final class Navigator: @unchecked Sendable {
    var path = NavigationPath()

    var applyingVenueFilter: VenueType?

    var selectedVenue: Venue? {
        willSet { newValue
            if let newValue {
                path = NavigationPath([newValue])
            }
        }
    }

    func navigate(to venue: Venue) {
        selectedVenue = venue
        path = NavigationPath([venue])
    }

    func navigateToRoot() {
        selectedVenue = nil
        path = NavigationPath()
    }

    func handleSystemSearch(for query: String) {
        if query.localizedCaseInsensitiveContains("bar") {
            setVenueFilter(to: .bar)
        } else if query.localizedCaseInsensitiveContains("restaurant") {
            setVenueFilter(to: .restaurant)
        } else {
            setVenueFilter(to: nil)
        }
    }

    func setVenueFilter(to type: VenueType?) {
        applyingVenueFilter = type
    }
}

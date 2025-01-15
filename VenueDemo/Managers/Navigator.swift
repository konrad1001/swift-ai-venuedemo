//
//  Navigator.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import MapKit
import SwiftUI

@Observable class Navigator {
    var path = NavigationPath()

    var position: MapCameraPosition {
        if let selectedVenue {
            return .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: selectedVenue.latitude, longitude: selectedVenue.longitude), distance: 10000))
        } else {
            return .camera(MapCamera(centerCoordinate: Locations.userDefault, distance: 10000))
        }
    }

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
}

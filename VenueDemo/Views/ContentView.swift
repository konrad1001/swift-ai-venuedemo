//
//  ContentView.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @Environment(VenueManager.self) private var venueManager
    @Environment(Navigator.self) private var navigator

    @State var position: MapCameraPosition = .camera(MapCamera(centerCoordinate: Locations.userDefault, distance: 10000))


    private var venues: [Venue] {
#if DEBUG
        return VenueManager.previewVenues
#else
        return venueManager.venues
#endif
    }

    var body: some View {
        @Bindable var navigator = navigator

        GeometryReader { geometryProxy in
            VStack {
                Map(position: $position, selection: $navigator.selectedVenue) {
                    ForEach(venues, id: \.id) { venue in
                        Marker(venue.name, coordinate: CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude))
                            .tag(venue)
                    }

                    Annotation("User", coordinate: Locations.userDefault) {
                        ZStack {
                            Circle()
                                .fill(.white)

                            Circle()
                                .fill(.blue)
                                .padding(3)
                        }
                        .frame(width: 22)
                    }
                }
                .frame(height:
                        navigator.path.isEmpty ? geometryProxy.size.height / 2 : geometryProxy.size.height / 3)
                .onChange(of: navigator.selectedVenue) { _, newValue in
                    withAnimation {
                        if let newValue {
                            position = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: newValue.latitude, longitude: newValue.longitude), distance: 6000))
                        } else {
                            position = .camera(MapCamera(centerCoordinate: Locations.userDefault, distance: 10000))
                        }
                    }
                }

                NavigationStack(path: $navigator.path) {
                    VenueListView(venues: venues)

                }
                .navigationBarBackButtonHidden(true)
            }
            .animation(.default, value: navigator.path)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environment(Navigator())
        .environment(VenueManager())
}

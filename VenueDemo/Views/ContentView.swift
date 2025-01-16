//
//  ContentView.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import AppIntents
import MapKit
import SwiftUI

struct ContentView: View {
    @Environment(VenueManager.self) private var venueManager
    @Environment(Navigator.self) private var navigator

    @State var position: MapCameraPosition = .camera(MapCamera(centerCoordinate: Locations.userDefault, distance: 10000))

    private var venues: [Venue] {
        return venueManager.venues.filter {
            if let type = navigator.applyingVenueFilter {
                return $0.type == type
            } else {
                return true
            }
        }
    }

    var body: some View {
        @Bindable var navigator = navigator

        GeometryReader { geometryProxy in
            VStack {
                Map(position: $position, selection: $navigator.selectedVenue) {
                    ForEach(venues, id: \.id) { venue in
                        Marker(venue.name, coordinate: CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude))
                            .tag(venue)
                            .tint(venue.type == .bar ? .orange : .blue)
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
                    VStack {
                        VenueListView(venues: venues)

                        SiriTipView(intent: FilterVenuesIntent())
                            .padding()

                        HStack {
                            ButtonView(type: .bar)

                            ButtonView(type: .restaurant)

                            Button(action: {
                                navigator.setVenueFilter(to: nil)
                            }, label: {
                                Text("All")
                                    .padding()
                                    .foregroundStyle(navigator.applyingVenueFilter == nil ? .black : .gray)
                            })
                        }
                    }
                    .animation(.default, value: navigator.path)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environment(Navigator())
        .environment(VenueManager())
}


struct ButtonView: View {
    @Environment(Navigator.self) private var navigator

    var type: VenueType

    var isSelected: Bool {
        navigator.applyingVenueFilter == type
    }

    var body: some View {

        Button(action: {
            navigator.setVenueFilter(to: type)
        }, label: {
            Text(type.displayValue)
                .padding()
                .foregroundStyle(isSelected ? .black : .gray)
        })
    }
}

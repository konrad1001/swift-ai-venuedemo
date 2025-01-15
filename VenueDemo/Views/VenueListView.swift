//
//  VenueListView.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

struct VenueListView: View {
    @Environment(Navigator.self) private var navigator

    var venues: [Venue]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(venues, id: \.id) { venue in
                    Button(action: {
                        navigator.navigate(to: venue)
                    }, label: {
                        VStack {
                            HStack {
                                Text(venue.name)
                                Spacer()
                            }
                            Divider()
                        }
                    })
                }
                .padding()
            }
        }
        .navigationDestination(for: Venue.self) { venue in
            VenueFocusedView(venue: venue)
        }
    }
}

#Preview {
    VenueListView(venues: VenueManager.previewVenues)
}

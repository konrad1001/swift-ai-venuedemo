//
//  VenueFocusedView.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

struct VenueFocusedView: View {
    @Environment(Navigator.self) private var navigator

    let venue: Venue

    var body: some View {
        VStack {
            Text(venue.name)

            Spacer()
        }
            .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                navigator.navigateToRoot()
                            }) {
                                Label("Back", systemImage: "arrow.left.circle")
                            }
                        }
                    }
    }
}

#Preview {
    VenueFocusedView(venue: VenueManager.previewVenues[0])
        .environment(Navigator())

}

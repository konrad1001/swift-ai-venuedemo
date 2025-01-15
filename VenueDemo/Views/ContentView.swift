//
//  ContentView.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VenueManager.self) private var venueManager
    @Environment(Navigator.self) private var navigator

    var body: some View {
        @Bindable var navigator = navigator

        NavigationStack(path: $navigator.path) {
            VStack {}
        }
    }
}

#Preview {
    ContentView()
        .environment(Navigator())
        .environment(VenueManager())
}

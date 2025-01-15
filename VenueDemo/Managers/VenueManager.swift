//
//  VenueManager.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//

import SwiftUI

@Observable class VenueManager {
    var venues: [Venue]

    init() {
        venues = []
    }

    func setUp() {
        Task {
            venues = try await fetchVenues()
        }
    }
}

extension VenueManager {
    enum Error: Swift.Error {
        case jsonFileNotFound
    }
}

extension VenueManager {
    private func fetchVenues() async throws -> [Venue]  {
        guard let path = Bundle.main.path(forResource: "ExampleData", ofType: "json") else {
            throw Error.jsonFileNotFound
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

        let response = try JSONDecoder().decode(VenuesResponse.self, from: data)

        return response.venues
    }

    static var previewVenues: [Venue] {
        return [
            Venue(
                id: "1",
                name: "Venue A",
                isFavourite: false,
                latitude: 51.5074,
                longitude: -0.1278),
            Venue(
                id: "2",
                name: "Venue B",
                isFavourite: false,
                latitude: 51.5154,
                longitude: -0.0931),
            Venue(
                id: "3",
                name: "Venue C",
                isFavourite: true,
                latitude: 51.5223,
                longitude:  -0.1063)
        ]
    }
}

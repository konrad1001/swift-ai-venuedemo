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
}

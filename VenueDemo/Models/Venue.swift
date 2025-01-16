//
//  Venue.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//
import SwiftUI

struct Venue: Codable, Hashable {
    var id: String
    var name: String
    var isFavourite: Bool
    var type: VenueType

    var latitude, longitude: Double

    init(id: String, name: String, isFavourite: Bool,
         type: VenueType, latitude: Double, longitude: Double)
    {
        self.id = id
        self.name = name
        self.isFavourite = isFavourite
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
    }
}

enum VenueType: String, Codable {
    case restaurant
    case bar

    var displayValue: String {
        switch self {
        case .bar: "Bars"
        case .restaurant: "Restaurants"
        }
    }
}

struct VenuesResponse: Codable {
    let venues: [Venue]
}



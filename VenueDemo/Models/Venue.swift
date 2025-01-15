//
//  Venue.swift
//  RestautantDemo
//
//  Created by Konrad Painta on 1/15/25.
//
import SwiftUI

struct Venue: Codable {
    var id: String
    var name: String
    var isFavourite: Bool

    var latitude, longitude: Double

    init(id: String,
         name: String, isFavourite: Bool,
         latitude: Double,
         longitude: Double)
    {
        self.id = id
        self.name = name
        self.isFavourite = isFavourite
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Venue: Hashable {
    
}

struct VenuesResponse: Codable {
    let venues: [Venue]
}

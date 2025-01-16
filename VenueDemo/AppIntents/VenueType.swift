//
//  VenueType.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents

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

extension VenueType: AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(name: "Venue Type")
    }

    static var caseDisplayRepresentations: [VenueType : DisplayRepresentation] = [
        .bar: "Bar",
        .restaurant: "Restaurant"
    ]

}

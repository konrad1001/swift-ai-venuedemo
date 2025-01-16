//
//  VenueEntityType.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents

@AssistantEnum(schema: .photos.assetType)
enum VenueEntityType: String {
    case bar
    case restautant

    static var caseDisplayRepresentations: [VenueEntityType : AppIntents.DisplayRepresentation] = [
        .bar: "Bar",
        .restautant: "Restaurant"
    ]
}

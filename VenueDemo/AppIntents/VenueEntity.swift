//
//  VenueEntity.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents
import CoreLocation

struct VenueEntity: AppEntity, IndexedEntity {
    static var defaultQuery = VenueEntityQuery()

    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(stringLiteral: "Venue")
    }

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(stringLiteral: "\(title)")
    }

    let id: String

    let title: String
    let type: VenueType
}

extension VenueEntity {
    struct VenueEntityQuery: EntityStringQuery {
        init() {}
        func entities(for identifiers: [VenueEntity.ID]) async throws -> [VenueEntity] { [] }
        func entities(matching string: String) async throws -> [VenueEntity] { [] }
    }
}

extension Venue {
    var entity: VenueEntity {
        VenueEntity(id: self.id, title: self.name, type: self.type)
    }
}



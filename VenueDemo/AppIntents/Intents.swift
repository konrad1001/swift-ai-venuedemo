//
//  Intents.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents

@AssistantIntent(schema: .system.search)
struct SystemSearchIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    var criteria: StringSearchCriteria

    @Dependency var navigator: Navigator

    func perform() async throws -> some IntentResult {
        navigator.handleSystemSearch(for: criteria.term)

        return .result()
    }
}

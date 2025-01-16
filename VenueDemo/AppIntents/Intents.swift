//
//  Intents.swift
//  VenueDemo
//
//  Created by Konrad Painta on 1/16/25.
//

import AppIntents
import SwiftUI

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

// Non assistant schema. 
struct FilterVenuesIntent: AppIntent {
    static var title = LocalizedStringResource("Filter Venues")
    static var description = IntentDescription("Filter by venue type")

    @Parameter(title: "Venue type")
    var type: VenueType

    @Dependency var navigator: Navigator

    init() {}

    init(type: VenueType) {
        self.type = type
    }

    func perform() async throws -> some IntentResult & ShowsSnippetView {
        navigator.setVenueFilter(to: type)

        return .result(view: finishedRequestView)
    }

    var finishedRequestView: some View {
        VStack {
            Text("🎉")
        }
        .padding()
    }
}


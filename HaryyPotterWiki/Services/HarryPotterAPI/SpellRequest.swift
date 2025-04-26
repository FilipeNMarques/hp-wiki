//
//  SpellRequest.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

/// Provides API access to spell-related endpoints.
enum SpellRequest {
    static func getAllSpells() async throws -> [SpellDTO] {
        try await NetworkService.fetch(HPEndpoints.allSpells, type: [SpellDTO].self)
    }
}

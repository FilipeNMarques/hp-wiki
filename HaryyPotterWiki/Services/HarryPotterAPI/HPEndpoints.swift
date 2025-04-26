//
//  HPEndpoints.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

/// A collection of endpoints for the Harry Potter API.
///
/// `HPEndpoints` provides URLs for fetching characters, students, staff, spells, and character details.
/// All endpoints are based on a common `baseURL`.
enum HPEndpoints {

    /// The base URL for the Harry Potter API.
    static let baseURL = URL(string: "https://hp-api.onrender.com/api")!

    /// Endpoint to fetch all characters.
    static var allCharacters: URL {
        baseURL.appendingPathComponent("characters")
    }

    /// Endpoint to fetch only student characters.
    static var students: URL {
        baseURL.appendingPathComponent("characters/students")
    }

    /// Endpoint to fetch only staff characters.
    static var staff: URL {
        baseURL.appendingPathComponent("characters/staff")
    }

    /// Endpoint to fetch detailed information about a specific character by ID.
    ///
    /// - Parameter id: The identifier of the character.
    /// - Returns: A `URL` for fetching the character's details.
    static func characterDetail(id: String) -> URL {
        baseURL.appendingPathComponent("character/\(id)")
    }

    /// Endpoint to fetch all spells.
    static var allSpells: URL {
        baseURL.appendingPathComponent("spells")
    }
}

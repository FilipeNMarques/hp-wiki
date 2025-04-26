//
//  CharacterRequest.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

/// Provides API access to character-related endpoints.
enum CharacterRequest {

    /// Fetches all characters from the API.
    static func getAllCharacters() async throws -> [CharacterDTO] {
          try await NetworkService.fetch(HPEndpoints.allCharacters, type: [CharacterDTO].self)
      }

    /// Fetches all students from Hogwarts.
    static func getStudents() async throws -> [CharacterDTO] {
        try await NetworkService.fetch(HPEndpoints.students, type: [CharacterDTO].self)
    }

    /// Fetches all staff members from Hogwarts.
    static func getStaff() async throws -> [CharacterDTO] {
        try await NetworkService.fetch(HPEndpoints.staff, type: [CharacterDTO].self)
    }

    /// Fetches the details of a character by ID.
    static func getCharacterDetail(id: String) async throws -> CharacterDTO {
        try await NetworkService.fetch(HPEndpoints.characterDetail(id: id), type: CharacterDTO.self)
    }
}

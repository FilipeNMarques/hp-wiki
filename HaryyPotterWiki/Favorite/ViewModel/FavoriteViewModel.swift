//
//  FavoriteViewModel.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import CoreData
import SwiftUI

/// The view model responsible for managing favorite characters.
///
/// `FavoriteViewModel` handles adding, removing, checking, and fetching favorites
/// using Core Data. It also maintains the favorite state for UI updates.
@MainActor
final class FavoriteViewModel: ObservableObject {
    @Published var isFavorite: Bool = false
    @Published var favorites: [CharacterEntity] = []

    /// Adds a character to the favorites list.
    ///
    /// - Parameters:
    ///   - dto: The character to be favorited.
    ///   - context: The Core Data context used for saving.
    func addFavorite(from dto: CharacterDTO, in context: NSManagedObjectContext) {
        let favorite = CharacterEntity(context: context)
        favorite.id = dto.id
        favorite.name = dto.name
        favorite.house = dto.house
        favorite.species = dto.species
        favorite.gender = dto.gender
        favorite.dateOfBirth = dto.dateOfBirth
        favorite.yearOfBirth = Int32(dto.yearOfBirth ?? 0)
        favorite.ancestry = dto.ancestry
        favorite.eyeColour = dto.eyeColour
        favorite.hairColour = dto.hairColour
        favorite.patronus = dto.patronus
        favorite.actor = dto.actor
        favorite.image = dto.image
        favorite.isStudent = dto.hogwartsStudent
        favorite.isStaff = dto.hogwartsStaff
        favorite.isWizard = dto.wizard
        favorite.wandWood = dto.wand?.wood
        favorite.wandCore = dto.wand?.core
        favorite.wandLength = dto.wand?.length ?? 0
        favorite.alive = dto.alive

        do {
            try context.save()
            isFavorite = true
        } catch {
            print("Failed to save favorite: \(error.localizedDescription)")
        }
    }

    /// Checks if a specific character is favorited.
    ///
    /// - Parameters:
    ///   - id: The identifier of the character.
    ///   - context: The Core Data context used for fetching.
    func checkIfFavorited(id: String, in context: NSManagedObjectContext) {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        request.fetchLimit = 1

        do {
            let result = try context.fetch(request)
            isFavorite = !result.isEmpty
        } catch {
            isFavorite = false
            print("Failed to fetch favorite: \(error.localizedDescription)")
        }
    }

    /// Removes a character from the favorites list.
    ///
    /// - Parameters:
    ///   - id: The identifier of the character to be removed.
    ///   - context: The Core Data context used for deletion.
    func removeFavorite(id: String, in context: NSManagedObjectContext) {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        request.fetchLimit = 1

        do {
            if let favorite = try context.fetch(request).first {
                context.delete(favorite)
                try context.save()
                isFavorite = false
            }
        } catch {
            print("Failed to remove favorite: \(error.localizedDescription)")
        }
    }

    /// Fetches all favorited characters.
    ///
    /// - Parameter context: The Core Data context used for fetching.
    func fetchFavorites(in context: NSManagedObjectContext) {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        do {
            favorites = try context.fetch(request)
        } catch {
            favorites = []
            print("Failed to fetch favorites: \(error.localizedDescription)")
        }
    }
}

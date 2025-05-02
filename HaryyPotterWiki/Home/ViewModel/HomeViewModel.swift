//
//  HomeViewModel.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

/// The view model responsible for managing and loading the home screen data.
///
/// `HomeViewModel` fetches and stores characters and spells based on the selected filter.
/// It handles loading state updates and ensures UI changes occur on the main thread.
@MainActor
final class HomeViewModel: ObservableObject {
    @Published var characters: [CharacterDTO] = []
    @Published var spells: [SpellDTO] = []
    @Published var isLoading: Bool = false

    /// Loads the data based on the selected `FilterType`.
    ///
    /// - Parameters:
    ///   - filter: The category of data to load (all characters, students, staff, or spells).
    func load(for filter: FilterType) async {
        await MainActor.run { isLoading = true }

        do {
            switch filter {
            case .all:
                let result = try await CharacterRequest.getAllCharacters()
                await MainActor.run {
                    characters = result
                }

            case .students:
                let result = try await CharacterRequest.getStudents()
                await MainActor.run {
                    characters = result
                }

            case .staff:
                let result = try await CharacterRequest.getStaff()
                await MainActor.run {
                    characters = result
                }

            case .spells:
                let result = try await SpellRequest.getAllSpells()
                await MainActor.run {
                    spells = result
                }
            }

            await MainActor.run { isLoading = false }

        } catch {
            await MainActor.run { isLoading = false }
            print("Failed to load data: \(error)")
        }
    }
}

//
//  House.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

/// Represents the four houses of Hogwarts School of Witchcraft and Wizardry.
///
/// `House` defines key properties such as display name, primary color, and accent color,
/// used throughout the app to personalize the UI based on the user's selection.
enum House: String, CaseIterable, Identifiable {
    /// Gryffindor house.
    case gryffindor
    /// Slytherin house.
    case slytherin
    /// Ravenclaw house.
    case ravenclaw
    /// Hufflepuff house.
    case hufflepuff

    /// A unique identifier for each house.
    var id: String { rawValue }

    /// The user-friendly display name of the house.
    var displayName: String {
        switch self {
        case .gryffindor: return "Gryffindor"
        case .slytherin: return "Slytherin"
        case .ravenclaw: return "Ravenclaw"
        case .hufflepuff: return "Hufflepuff"
        }
    }

    /// The primary color associated with the house.
    var primaryColor: Color {
        switch self {
        case .gryffindor: return Color("HPGryffindorColor")
        case .slytherin: return Color("HPSlytherinColor")
        case .ravenclaw: return Color("HPRavenclawColor")
        case .hufflepuff: return Color("HPHufflepuffColor")
        }
    }

    /// The accent color associated with the house, used for highlights and UI accents.
    var accentColor: Color {
        switch self {
        case .gryffindor: return Color("HPGryffindorAccentColor")
        case .slytherin: return Color("HPSlytherinAccentColor")
        case .ravenclaw: return Color("HPRavenclawAccentColor")
        case .hufflepuff: return Color("HPHufflepuffAccentColor")
        }
    }
}

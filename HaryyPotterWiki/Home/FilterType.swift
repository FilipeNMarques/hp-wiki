//
//  FilterType.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case all = "All"
    case students = "Students"
    case staff = "Staff"
    case spells = "Spells"

    var id: String { self.rawValue }
}

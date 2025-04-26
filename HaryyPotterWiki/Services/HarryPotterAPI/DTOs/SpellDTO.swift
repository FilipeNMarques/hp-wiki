//
//  SpellDTO.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

struct SpellDTO: Codable, Identifiable {
    var id: String { name }
    let name: String
    let description: String
}

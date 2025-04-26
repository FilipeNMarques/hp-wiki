//
//  CharacterDTO.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

struct CharacterDTO: Codable, Identifiable {
    var id: String { name }
    let name: String
    let house: String
    let species: String
    let gender: String
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let patronus: String?
    let actor: String?
    let image: String?
    let wizard: Bool
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let alive: Bool
    let wand: Wand?

    struct Wand: Codable {
        let wood: String?
        let core: String?
        let length: Double?
    }
}

extension CharacterEntity {
    func toDTO() -> CharacterDTO {
        return CharacterDTO(
            name: self.name ?? "",
            house: self.house ?? "",
            species: self.species ?? "",
            gender: self.gender ?? "",
            dateOfBirth: self.dateOfBirth,
            yearOfBirth: Int(self.yearOfBirth),
            ancestry: self.ancestry,
            eyeColour: self.eyeColour,
            hairColour: self.hairColour,
            patronus: self.patronus,
            actor: self.actor,
            image: self.image,
            wizard: self.isWizard,
            hogwartsStudent: self.isStudent,
            hogwartsStaff: self.isStaff,
            alive: self.alive,
            wand: nil
        )
    }
}

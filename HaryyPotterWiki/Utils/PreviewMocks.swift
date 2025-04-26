//
//  PreviewMocks.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation
import CoreData

struct PreviewMocks {
    static func mockCharacters(in context: NSManagedObjectContext) -> [CharacterEntity] {
        let harry = CharacterEntity(context: context)
        harry.id = UUID().uuidString
        harry.name = "Harry Potter"
        harry.house = "Gryffindor"
        harry.species = "Human"
        harry.gender = "Male"
        harry.image = "https://ik.imagekit.io/hpapi/harry.jpg"
        harry.alive = true
        harry.isWizard = true
        harry.isStudent = true
        harry.isStaff = false

        let hermione = CharacterEntity(context: context)
        hermione.id = UUID().uuidString
        hermione.name = "Hermione Granger"
        hermione.house = "Gryffindor"
        hermione.species = "Human"
        hermione.gender = "Female"
        hermione.image = "https://ik.imagekit.io/hpapi/hermione.jpeg"
        hermione.alive = true
        hermione.isWizard = true
        hermione.isStudent = true
        hermione.isStaff = false

        let draco = CharacterEntity(context: context)
        draco.id = UUID().uuidString
        draco.name = "Draco Malfoy"
        draco.house = "Slytherin"
        draco.species = "Human"
        draco.gender = "Male"
        draco.image = "https://ik.imagekit.io/hpapi/draco.jpg"
        draco.alive = true
        draco.isWizard = true
        draco.isStudent = true
        draco.isStaff = false

        return [harry, hermione, draco]
    }
}

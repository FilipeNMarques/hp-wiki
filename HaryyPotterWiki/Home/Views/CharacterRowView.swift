//
//  CharacterRowView.swift
//  HarryPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct CharacterRowView: View {
    let dto: CharacterDTO

    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .gryffindor
    }

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: dto.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .shadow(radius: 4)

            VStack(alignment: .leading) {
                Text(dto.name)
                    .font(.headline)
                    .foregroundColor(selectedHouse.primaryColor)
                    .animation(.easeInOut, value: preferredHouseRaw)

                if !dto.house.isEmpty {
                    Text(dto.house)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CharacterRowView(dto: CharacterDTO(
        name: "Harry Potter",
        house: "Gryffindor",
        species: "Human",
        gender: "Male",
        dateOfBirth: nil,
        yearOfBirth: nil,
        ancestry: nil,
        eyeColour: nil,
        hairColour: nil,
        patronus: nil,
        actor: nil,
        image: "https://ik.imagekit.io/hpapi/harry.jpg",
        wizard: true,
        hogwartsStudent: true,
        hogwartsStaff: false,
        alive: true,
        wand: nil
    ))
}

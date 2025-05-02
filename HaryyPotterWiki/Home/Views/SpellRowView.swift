//
//  SpellRowView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct SpellRowView: View {
    let spell: SpellDTO

    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .gryffindor
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(spell.name)
                .font(.headline)
                .foregroundColor(selectedHouse.primaryColor)

            Text(spell.description)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SpellRowView(spell: SpellDTO(
        name: "Expelliarmus",
        description: "Disarms your opponent."
    ))
    .background(Color("HPPrimaryColor"))
}

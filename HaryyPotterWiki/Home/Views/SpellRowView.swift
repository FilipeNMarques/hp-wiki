//
//  SpellRowView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct SpellRowView: View {
    let spell: SpellDTO

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(spell.name)
                .font(.headline)
                .foregroundColor(Color("HPAccentColor"))

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

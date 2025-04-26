//
//  CharacterDetailView.swift
//  HarryPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI
import CoreData

struct CharacterDetailView: View {
    let dto: CharacterDTO

    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) private var dismiss
    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .hufflepuff
    }
    @StateObject private var favoriteViewModel = FavoriteViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let imageUrl = dto.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                            .cornerRadius(16)
                            .shadow(radius: 10)
                            .shadow(color: .black.opacity(0.15), radius: 30, x: 0, y: 10)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(height: 300)
                            .cornerRadius(16)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(dto.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(selectedHouse.primaryColor)

                    if !dto.house.isEmpty {
                        Text("House: \(dto.house)")
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    if let ancestry = dto.ancestry {
                        Text("Ancestry: \(ancestry)")
                            .foregroundColor(.white)
                    }

                    if let patronus = dto.patronus {
                        Text("Patronus: \(patronus)")
                            .foregroundColor(.white)
                    }

                    if let actor = dto.actor {
                        Text("Portrayed by: \(actor)")
                            .foregroundColor(.white)
                    }

                    if dto.hogwartsStudent {
                        Text("Hogwarts Student 🧑‍🎓")
                            .foregroundColor(.white)
                    }

                    if dto.hogwartsStaff {
                        Text("Hogwarts Staff 🧑‍🏫")
                            .foregroundColor(.white)
                    }

                    if !dto.alive {
                        Text("⚰️ This character is deceased.")
                            .foregroundColor(.red)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
        }
        .background(Color("HPPrimaryColor").ignoresSafeArea())
        .navigationTitle(dto.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(dto.name)
                    .font(.title2.bold())
                    .foregroundColor(selectedHouse.primaryColor)
                    .animation(.easeInOut, value: preferredHouseRaw)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        if favoriteViewModel.isFavorite {
                            favoriteViewModel.removeFavorite(id: dto.id, in: context)
                        } else {
                            favoriteViewModel.addFavorite(from: dto, in: context)
                        }
                    }
                }) {
                    Image(systemName: favoriteViewModel.isFavorite ? "star.fill" : "star")
                        .foregroundColor(favoriteViewModel.isFavorite ? .yellow : selectedHouse.primaryColor)
                        .symbolEffect(.bounce, value: favoriteViewModel.isFavorite)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("HPPrimaryColor"), for: .navigationBar)
        .tint(selectedHouse.primaryColor)
        .onAppear {
            favoriteViewModel.checkIfFavorited(id: dto.id, in: context)
        }
    }
}

#Preview {
    NavigationStack {
        CharacterDetailView(dto: CharacterDTO(
            name: "Harry Potter",
            house: "Gryffindor",
            species: "Human",
            gender: "Male",
            dateOfBirth: nil,
            yearOfBirth: nil,
            ancestry: "Half-blood",
            eyeColour: "Green",
            hairColour: "Black",
            patronus: "Stag",
            actor: "Daniel Radcliffe",
            image: "https://ik.imagekit.io/hpapi/harry.jpg",
            wizard: true,
            hogwartsStudent: true,
            hogwartsStaff: false,
            alive: true,
            wand: nil
        ))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

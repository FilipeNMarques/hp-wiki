//
//  FavoritesView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @Environment(\.managedObjectContext) private var context
    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .gryffindor
    }

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CharacterEntity.name, ascending: true)],
        animation: .default
    )
    private var favorites: FetchedResults<CharacterEntity>

    var body: some View {
        NavigationStack {
            Group {
                if favorites.isEmpty {
                    VStack {
                        Spacer()
                        Text("No favorites yet.")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("HPPrimaryColor"))
                } else {
                    List {
                        ForEach(favorites) { character in
                            NavigationLink(destination: CharacterDetailView(dto: character.toDTO())) {
                                CharacterRowView(dto: character.toDTO())
                            }
                            .listRowBackground(Color("HPPrimaryColor"))
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    deleteFavorite(character: character)
                                } label: {
                                    Label("Remove Favorite", systemImage: "heart.slash.fill")
                                }
                                .tint(.yellow)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color("HPPrimaryColor"))
                    .listStyle(.plain)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Favorites")
                        .font(.title)
                        .bold()
                        .foregroundColor(selectedHouse.primaryColor)
                        .animation(.easeInOut, value: preferredHouseRaw)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color("HPPrimaryColor"), for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("HPPrimaryColor").ignoresSafeArea())
        }
        .tint(selectedHouse.primaryColor)
    }

    private func deleteFavorite(character: CharacterEntity) {
        context.delete(character)
        do {
            try context.save()
        } catch {
            print("Failed to delete favorite: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    _ = PreviewMocks.mockCharacters(in: context)

    return NavigationStack {
        FavoritesView()
    }
    .environment(\.managedObjectContext, context)
}

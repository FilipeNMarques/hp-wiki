//
//  HomeView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFilter: FilterType = .all
    @StateObject private var viewModel = HomeViewModel()

    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .gryffindor
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Filter", selection: $selectedFilter) {
                        ForEach(FilterType.allCases) { filter in
                            Text(filter.rawValue)
                                .tag(filter)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .foregroundStyle(selectedHouse.primaryColor)
                    .background(
                        Color("HPPrimaryColor")
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    .tint(selectedHouse.primaryColor)
                }
                .listRowBackground(Color("HPPrimaryColor"))

                Section {
                    if selectedFilter == .spells {
                        ForEach(viewModel.spells) { spell in
                            SpellRowView(spell: spell)
                                .listRowBackground(Color("HPPrimaryColor"))
                        }
                    } else {
                        ForEach(viewModel.characters) { character in
                            NavigationLink(destination: CharacterDetailView(dto: character)) {
                                CharacterRowView(dto: character)
                            }
                            .listRowBackground(Color("HPPrimaryColor"))
                        }
                    }
                }
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("HPPrimaryColor").ignoresSafeArea())
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Harry Potter Wiki")
                        .foregroundColor(selectedHouse.primaryColor)
                        .font(.title).bold()
                        .animation(.easeInOut, value: preferredHouseRaw)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color("HPPrimaryColor"), for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task(id: selectedFilter) {
            Task.detached(priority: .userInitiated) {
                await viewModel.load(for: selectedFilter)
            }
        }
        .tint(selectedHouse.primaryColor)
    }
}

#Preview {
    HomeView()
}

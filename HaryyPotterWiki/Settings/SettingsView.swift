//
//  SettingsView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("preferredHouse") private var preferredHouseRaw: String = House.gryffindor.rawValue
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw) ?? .gryffindor
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Your House")
                        .font(.title2)
                        .bold()
                        .foregroundColor(selectedHouse.primaryColor)
                        .animation(.easeInOut, value: preferredHouseRaw)

                    Text(selectedHouse.displayName)
                        .font(.title)
                        .foregroundColor(selectedHouse.primaryColor)
                        .animation(.easeInOut, value: preferredHouseRaw)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Do you want to change? Select a new house below:")
                        .font(.headline)
                        .foregroundColor(.white)

                    Picker("Select House", selection: $preferredHouseRaw) {
                        ForEach(House.allCases) { house in
                            Text(house.displayName)
                                .foregroundColor(.white)
                                .tag(house.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(maxHeight: 150)
                    .clipped()
                    .tint(Color("HPAccentColor"))
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .background(Color("HPPrimaryColor"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Settings")
                        .font(.title)
                        .bold()
                        .foregroundColor(selectedHouse.primaryColor)
                        .animation(.easeInOut, value: preferredHouseRaw)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color("HPPrimaryColor"), for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(Color("HPAccentColor"))
    }
}

#Preview {
    SettingsView()
}

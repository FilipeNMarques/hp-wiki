//
//  OnboardingView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedHouse: House? = nil
    @AppStorage("preferredHouse") private var preferredHouse: String = ""

    var body: some View {
        VStack(spacing: 32) {
            Text("Choose your house")
                .font(.largeTitle.bold())
                .foregroundColor(Color("HPAccentColor"))
                .padding(.top, 40)

            Spacer()

            VStack(spacing: 24) {
                HStack(spacing: 24) {
                    houseButton(for: .gryffindor)
                    houseButton(for: .slytherin)
                }
                HStack(spacing: 24) {
                    houseButton(for: .ravenclaw)
                    houseButton(for: .hufflepuff)
                }
            }

            Spacer()

            Button(action: {
                if let house = selectedHouse {
                    preferredHouse = house.rawValue
                }
            }) {
                Label("Alohomora", systemImage: "wand.and.stars")
                    .font(.title.weight(.semibold))
                    .frame(maxWidth: .infinity, minHeight: 50)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("HPAccentColor"))
            .symbolEffect(.pulse, value: selectedHouse != nil)
            .disabled(selectedHouse == nil)
            .animation(.easeInOut, value: selectedHouse)
            .padding(.horizontal, 34)
        }
        .background(Color("HPPrimaryColor"))
    }

    private func houseButton(for house: House) -> some View {
        Button(action: {
            selectedHouse = house
        }) {
            Text(house.displayName)
                .font(.title3.bold())
                .foregroundColor(.white)
                .frame(width: 140, height: 100)
                .background(house.primaryColor)
                .cornerRadius(16)
                .shadow(radius: 5)
        }
        .scaleEffect(selectedHouse == house ? 1.10 : 1.0)
        .animation(.easeInOut, value: selectedHouse)
    }
}

#Preview {
    OnboardingView()
}

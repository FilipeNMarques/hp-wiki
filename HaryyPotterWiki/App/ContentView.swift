//
//  ContentView.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("preferredHouse") private var preferredHouseRaw: String?
    private var selectedHouse: House {
        House(rawValue: preferredHouseRaw ?? "") ?? .gryffindor
    }

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "HPPrimaryColor")

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        if preferredHouseRaw == nil {
            OnboardingView()
        } else {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)

                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star.fill")
                    }
                    .tag(1)

                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(2)
            }
            .accentColor(selectedHouse.primaryColor)
            .animation(.easeInOut, value: preferredHouseRaw)
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext

    _ = PreviewMocks.mockCharacters(in: context)

    return ContentView()
        .environment(\.managedObjectContext, context)
}

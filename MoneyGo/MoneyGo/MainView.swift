//
//  MainView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct MainView: View {
    @State private var goals = Goals.data
    @State private var selectedTab = 0
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Themes] = themeData
    
    @State private var showOnboardingView: Bool = true
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            PersonalityView()
                .tabItem {
                    Label("Personality", systemImage: "person")
                }
                .tag(0)
            
            GoalsView(goals: $goals)
                .tabItem {
                    Label("Goals", systemImage: "target")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(2)
        }
        .accentColor(themes[self.theme.themeSettings].color)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

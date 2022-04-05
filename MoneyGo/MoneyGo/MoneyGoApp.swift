//
//  MoneyGoApp.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

@main
struct MoneyGoApp: App {
    @State var showOnboardingView: Bool = true
    
    var body: some Scene {
        
        WindowGroup {
           MainView()
                .fullScreenCover(isPresented: $showOnboardingView) {
                    NavigationView {
                        
                        OnboardingView(showOnboardingView: $showOnboardingView)
                    }
                }
        }
    }
}

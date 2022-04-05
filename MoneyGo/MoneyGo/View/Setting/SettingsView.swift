//
//  SettingsView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct SettingsView: View {
    let themes: [Themes] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    let currencies: [Currencies] = currencyData
    @ObservedObject var currency = CurrencySettings.shared
    
    @State private var isNewThemeOn: Bool = false
    
    var body: some View {
        let currentTheme = themes[self.theme.themeSettings]
        let currentCurrency = currencies[self.currency.currencySettings]
        
        NavigationView {
            Form {
                Section(header: Text("Application info")) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                                .imageScale(.large)
                            Text("Retake Personality Quiz").bold()
                        }
                        .foregroundColor(.blue)
                    }
                    .padding(.vertical, 5)
                    
                    NavigationLink(destination: CurrencyListView()) {
                        HStack {
                            Image(systemName: "\(currentCurrency.icon)")
                                .imageScale(.large)
                            Text("Switch currency")
                        }
                        .padding(.vertical, 5)
                    }
                    
                    NavigationLink(destination: LanguageListView()) {
                        HStack {
                            Image(systemName: "globe")
                                .imageScale(.large)
                            Text("Change language")
                        }
                        .padding(.vertical, 5)
                    }
                }
                
                Section(header: Text("Application Theme")) {
                    List {
                        ForEach(themes, id: \.id) { theme in
                            Button(action: {
                                self.theme.themeSettings = theme.id
                                UserDefaults.standard.set(self.theme.themeSettings, forKey: "Themes")
                                self.isNewThemeOn.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(theme.color)
                                        .imageScale(.large)
                                    Text(theme.name)
                                    Spacer()
                                    if theme.id == currentTheme.id {
                                        Image(systemName: "checkmark")
                                            .tint(.blue)
                                        
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                            .accentColor(.primary)
                        }
                    }
                }
                .alert(isPresented: $isNewThemeOn) {
                    Alert(
                        title: Text("Success"),
                        message: Text("The \(currentTheme.name.lowercased()) has been applied"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
                Section(header: Text("Technical info")) {
                    HStack {
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                        Text("Application")
                        Spacer()
                        Text("MoneyGo")
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Image(systemName: "checkmark.seal")
                            .imageScale(.large)
                        Text("Compatibility")
                        Spacer()
                        Text("iPhone")
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Image(systemName: "flag")
                            .imageScale(.large)
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                    .padding(.vertical, 5)
                }
                
                Section(header: Text("Team info")) {
                    HStack {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                        Text("Davide Belardi")
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                        Text("Eleonora Franco")
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                        Text("Gianluca Lucchesi")
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                        Text("Lorenzo Mazzarotto")
                    }
                    .padding(.vertical, 5)
                }
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

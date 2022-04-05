//
//  CurrencyListView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 22/11/21.
//

import SwiftUI

struct CurrencyListView: View {
    let currencies: [Currencies] = currencyData
    @ObservedObject var currency = CurrencySettings.shared
    
    let themes: [Themes] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        let currentTheme = themes[self.theme.themeSettings]
        let currentCurrency = currencies[self.currency.currencySettings]
        
        List {
            ForEach(currencies, id: \.id) { currency in
                Button(action: {
                    self.currency.currencySettings = currency.id
                    UserDefaults.standard.set(self.currency.currencySettings, forKey: "Currencies")
                }) {
                    HStack {
                        Image(systemName: "\(currency.icon)")
                            .foregroundColor(currentTheme.color)
                            .imageScale(.large)
                        Text(currency.name)
                        Spacer()
                        if currency.id == currentCurrency.id {
                            Image(systemName: "checkmark")
                                .tint(.blue)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .accentColor(.primary)
            }
        }
        .navigationBarTitle("Currency")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}

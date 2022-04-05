//
//  Themes.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 17/11/21.
//

import SwiftUI

struct Themes: Identifiable {
    let id: Int
    let name: String
    let color: Color
}

struct Currencies: Identifiable {
    let id: Int
    let name: String
    let icon: String
    let sign: String
}

struct Languages: Identifiable {
    let id: Int
    let name: String
}

final public class ThemeSettings: ObservableObject {
    @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Themes") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Themes")
        }
    }
    
    private init() {}
    public static let shared = ThemeSettings()
}

final public class CurrencySettings: ObservableObject {
    @Published public var currencySettings: Int = UserDefaults.standard.integer(forKey: "Currencies") {
        didSet {
            UserDefaults.standard.set(self.currencySettings, forKey: "Currencies")
        }
    }
    
    private init() {}
    public static let shared = CurrencySettings()
}

let themeData: [Themes] = [
    Themes(id: 0, name: "Blue theme", color: .blue),
    Themes(id: 1, name: "Green theme", color: .green),
    Themes(id: 2, name: "Pink theme", color: .pink)
]

let currencyData: [Currencies] = [
    Currencies(id: 0, name: "Dollar", icon: "dollarsign.circle", sign: "$"),
    Currencies(id: 1, name: "Euro", icon: "eurosign.circle", sign: "€"),
    Currencies(id: 2, name: "Brazilian Real", icon: "brazilianrealsign.circle", sign: "R$"),
    Currencies(id: 3, name: "Yen", icon: "yensign.circle", sign: "¥"),
    Currencies(id: 4, name: "Sterling", icon: "sterlingsign.circle", sign: "£"),
    Currencies(id: 5, name: "Turkish Lira", icon: "turkishlirasign.circle", sign: "₺"),
    Currencies(id: 6, name: "Ruble", icon: "rublesign.circle", sign: "₽"),
    Currencies(id: 7, name: "Dong", icon: "dongsign.circle", sign: "₫"),
    Currencies(id: 8, name: "Indian Rupee", icon: "indianrupeesign.circle", sign: "₹"),
    Currencies(id: 9, name: "Tenge", icon: "tengesign.circle", sign: "₸"),
]

let languageData: [Languages] = [
    Languages(id: 0, name: "English"),
    Languages(id: 1, name: "Italian"),
    Languages(id: 2, name: "Portuguese"),
    Languages(id: 3, name: "Japanese"),
    Languages(id: 4, name: "Turkish"),
    Languages(id: 5, name: "Russian"),
    Languages(id: 6, name: "Vietnamese"),
    Languages(id: 7, name: "Indian")
]

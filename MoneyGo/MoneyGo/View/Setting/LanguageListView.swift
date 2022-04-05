//
//  LanguageListView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 22/11/21.
//

import SwiftUI

struct LanguageListView: View {
    let languages: [Languages] = languageData
    
    let themes: [Themes] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    var body: some View {
        List {
            ForEach(languages, id: \.id) { language in
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(language.name)
                }
                .padding(.vertical, 5)
                .accentColor(.primary)
            }
        }
        .navigationBarTitle("Language")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView()
    }
}

//
//  DetailView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct DetailView: View {
    @Binding var goal: Goals
    @State private var data: Goals.Data = Goals.Data()
    @State private var isPresented = false
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Themes] = themeData
    @ObservedObject var currency = CurrencySettings.shared
    let currencies: [Currencies] = currencyData
    
    var body: some View {
        let currentCurrency = currencies[self.currency.currencySettings]
        
        List {
            Section(header: Text("Goal Info")) {
                HStack {
                    Label("Value", systemImage: "\(currentCurrency.icon)")
                    Spacer()
                    Text("\(currentCurrency.sign) \(goal.value)")
                }
                .padding(.vertical, 5)
                
                HStack {
                    Label("Date", systemImage: "clock")
                    Spacer()
                    Text("\(goal.date.formatted(date: .abbreviated, time: .omitted))")
                }
                .padding(.vertical, 5)
                
                HStack {
                    Label("Priority", systemImage: "exclamationmark.triangle")
                    Spacer()
                    Text("\(goal.priority.rawValue)")
                }
                .padding(.vertical, 5)
                
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(goal.color)
                }
                .padding(.vertical, 5)
            }
            
            Section {
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 20) {
                        Text("You'll have to save each day")
                        Text("\(currentCurrency.sign) \(String(format: "%.2f", goal.needToSave()))")
                            .font(.title.bold())
                    }
                    Spacer()
                }
                .listRowBackground(Color.clear)
            }
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            data = goal.data
        })
        .navigationTitle(goal.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(goalData: $data)
                    .navigationTitle("Edit goal")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Save") {
                        isPresented = false
                        goal.update(from: data)
                    })
                    .accentColor(themes[self.theme.themeSettings].color)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(goal: .constant(Goals.data[0]))
        }
    }
}


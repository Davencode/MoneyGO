//
//  EditView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct EditView: View {
    @Binding var goalData: Goals.Data
    
    @ObservedObject var currency = CurrencySettings.shared
    let currencies: [Currencies] = currencyData
    
    var body: some View {
        let currentCurrency = currencies[self.currency.currencySettings]
        
        List {
            Section(header: Text("Goal Info")) {
                HStack{
                    Text("\(currentCurrency.sign)")
                    Spacer()
                    TextField("Value", value: $goalData.value, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 5)
                
                TextField("Title", text: $goalData.title)
                    .padding(.vertical, 5)
                DatePicker("Date", selection: $goalData.date, in: Date.now.addingTimeInterval(86400)..., displayedComponents: .date)
                    .padding(.vertical, 5)
                
                Picker(selection: $goalData.priority, label: Text("Picker")) {
                    ForEach(Goals.Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical, 5)
                
                ColorPicker("Color", selection: $goalData.color)
                    .padding(.vertical, 5)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(goalData: .constant(Goals.data[0].data))
    }
}

//
//  PersonalityCardView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 24/11/21.
//

import SwiftUI

struct PersonalityCardView: View {
    var card: Cards
    @State var showSheet = false
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Image("\(card.imageName)")
                .resizable()
                .shadow(radius: 7)
                .frame(width: 80, height: 80)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(card.title)
                .foregroundColor(.black)
                .font(.title3).bold()
            Spacer()
        }
        .frame(width: 300, height: 130)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(16)
        .shadow(radius: 5)
        .sheet(isPresented: $showSheet, content: {
            
            NavigationView {
                ScrollView {
                    Rectangle()
                        .frame(height: 60)
                        .foregroundColor(Color.white)
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(UIColor.systemGray6))
                            .frame(height: 550)
                            .offset(x: 0, y: -30)
                        Image(card.imageName)
                            .resizable()
                            .shadow(radius: 7)
                            .frame(width: 160, height: 160)
                            .offset(x: 0, y: -310)
                        
                        VStack(alignment: .center) {
                            Text(card.title)
                                .font(.title)
                                .bold()
                            
                            List {
                                Section(header: Text("Characteristics")) {
                                    Text(card.characteristics1)
                                    Text(card.characteristics2)
                                    Text(card.characteristics3)
                                }
                                
                                Section(header: Text("Money Advice")) {
                                    Text(card.moneyAdvice1)
                                    Text(card.moneyAdvice2)
                                }
                            }
                            .offset(x: 0, y: -20)
                            
                        }
                        .offset(x: 0, y: 50)
                        
                    }
                    .background(Color(UIColor.systemGray6))
                }
                .ignoresSafeArea(edges: .bottom)
                .navigationBarItems(leading: Button("Close") {
                    showSheet = false
                })
            }
        })
    }
}

struct PersonalityCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityCardView(card: Cards.data[0])
    }
}

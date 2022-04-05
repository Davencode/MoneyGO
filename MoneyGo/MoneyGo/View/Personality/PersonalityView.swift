//
//  PersonalityView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 17/11/21.
//

import SwiftUI

struct PersonalityView: View {
    var cards: [Cards] = Cards.data

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Rectangle()
                        .frame(height: 120)
                        .foregroundColor(Color.white)
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(UIColor.systemGray6))
                            .frame(height: 520)
                            .offset(x: 0, y: -30)
                        Image("compSpender")
                            .resizable()
                            .shadow(radius: 7)
                            .frame(width: 160, height: 160)
                            .offset(x: 0, y: -300)
                        
                        VStack(alignment: .center) {
                            Text("You are a")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Compulsive Spender")
                                .font(.title)
                                .bold()
                            
                            List {
                                Section(header: Text("Characteristics")) {
                                    Text("Often makes unnecessary purchases.")
                                    Text("Spends when in emotional distress, or for immediate gratification.")
                                    Text("Experiences buyer’s remorse after big splurges.")
                                }

                                Section(header: Text("Money Advice")) {
                                    Text("Creating a budget plan will help you see things from a different perspective.")
                                    Text("Remind yourself that buying a second car, for example, means sacrificing money on essential things like saving for retirement or paying off debt.")
                                }
                            }

                            .offset(x: 0, y: -20)
                        }
                        .offset(x: 0, y: 50)
                        
                    }
                    
                    HStack {
                        Text("Other personalities")
                            .font(.title2).bold()
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(cards) { item in
                                PersonalityCardView(card: item)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 60)
                        .padding(.top, 15)
                        
                    }
                }
            }
            .navigationTitle("Personality")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct PersonalityView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityView()
    }
}

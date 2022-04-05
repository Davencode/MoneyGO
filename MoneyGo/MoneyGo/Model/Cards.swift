//
//  Cards.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 24/11/21.
//

import SwiftUI

struct Cards: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var characteristics1: String
    var characteristics2: String
    var characteristics3: String
    var moneyAdvice1: String
    var moneyAdvice2: String
}

extension Cards {
    static var data: [Cards] {
        [
            Cards(
                title: "Compulsive Saver",
                imageName: "compSaver",
                characteristics1: "Saves money endlessly, sometimes with no actual end goal in mind.",
                characteristics2: "Views money as a source of security",
                characteristics3: "Frugal and financially responsible",
                moneyAdvice1: "It’s all about moderation; learn to find a balance between saving money and enjoying life.",
                moneyAdvice2: "Think about where you see yourself in the future and how you can use your savings to get there."),
            
            Cards(title: "Saver-Splurger",
                  imageName: "saverSplurg",
                  characteristics1: "Shares combination of traits between savers and spenders", characteristics2: "Is smart with money for a certain amount of time, but may then give into spending impulses out of nowhere", characteristics3: "When using savings, might spend on unnecessary things ", moneyAdvice1: "Saver-Splurgers rarely put thought into what they’re spending on when they decide to splurge.", moneyAdvice2: "Before any big purchase, imagine how you might feel the following week or two. Don’t lose sight of your financial goals."),
            Cards(title: "Indifferent to Money", imageName: "indifferent", characteristics1: "Tends to be financially well-off", characteristics2: "Rarely thinks about money", characteristics3: "Feels money should not influence important decisions in life", moneyAdvice1: "Even if you are financially comfortable, make it a point to know things like where your money is going, what your monthly expenses are, and where you stand on debt.", moneyAdvice2: "Doing all these things can save you a lot of financial stress in the future.")
        ]
    }
}

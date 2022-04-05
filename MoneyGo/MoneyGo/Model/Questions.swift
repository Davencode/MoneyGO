//
//  Questions.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 23/11/21.
//

import SwiftUI

struct Questions {
    let title: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
}

extension Questions {
    static var data: [Questions] {
        [
            Questions(
                title: "If $20,000 came to me unexpectedly, my first impulse would be to:",
                answer1: "Spend it on things I want, including gifts for others.",
                answer2: "Immediately put it somewhere safe so it won't get frittered away.",
                answer3: "Could either save it or spend it for something expensive.",
                answer4: "I would be happy, but I wouldn’t care much."),
            
            Questions(
                title: "My primary financial objective is:",
                answer1: "To save enough money now so I never have to worry.",
                answer2: "Unclear to me, I don't have a financial objective.",
                answer3: "To have enough of it to ensure that I can buy whatever I want.",
                answer4: "To have enough to satisfy my basic needs."),
            
            Questions(
                title: "When it comes to spending:",
                answer1: "I enjoy spending money, as long as I can keep saving more.",
                answer2: "Spending makes me nervous, I save for unexpected expenses.",
                answer3: "I don't care where my money goes, I have other priorities.",
                answer4: "I love spending money, and I tend to spend more than I earn."),
            
            Questions(
                title: "When it comes to saving:",
                answer1: "I have trouble saving money, which bothers me sometimes.",
                answer2: "If I had enough money to save, I'd give it away instead.",
                answer3: "Saving comes naturally to me. I am regular and consistent about it.",
                answer4: "I don’t think much about saving my money."),
            
            Questions(
                title: "When I really want to buy something that's not in my budget:",
                answer1: "What budget? Everything will work out all right.",
                answer2: "I'd have to think hard before giving myself permission to spend.",
                answer3: "I'll buy it whether or not I can afford it.",
                answer4: "Maybe I could buy it, even though later on I could regret it."),
            
            Questions(
                title: "I worry about money:",
                answer1: "Somewhat, but I'm doing all I can to make sure I have enough.",
                answer2: "Never. I worry about more important things.",
                answer3: "Constantly. It's the main thing I worry about.",
                answer4: "What, me worry? I just enjoy spending it!"),
            
            Questions(
                title: "When I think about providing for my future:",
                answer1: "Quite concerned, since it's been so hard for me to save.",
                answer2: "Reasonably confident, I've been saving systematically for years.",
                answer3: "Confident, but I should be careful not to spend too much.",
                answer4: "I’m not concerned about my future financial situation."),
            
            Questions(
                title: "If I won a million dollars in the lottery, my first reaction would be:",
                answer1: "Relieved that my future was now secure.",
                answer2: "Totally overwhelmed. I would have no idea how to handle it.",
                answer3: "Content, but money should not influence important life decisions.",
                answer4: "Wildly excited, from now on I could buy anything I wanted.")
        ]
    }
}

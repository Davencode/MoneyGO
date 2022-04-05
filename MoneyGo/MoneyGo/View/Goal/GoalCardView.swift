//
//  GoalCardView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct GoalCardView: View {
    let goal: Goals
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(goal.color)
            Text(goal.title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(goal.priority.rawValue)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(3)
                .frame(minWidth: 62)
                .overlay(Capsule().strokeBorder(Color.gray, lineWidth: 0.75))
        }
        .padding(.vertical, 10)
    }
}

struct GoalCardView_Previews: PreviewProvider {
    static var goal = Goals.data[0]
    static var previews: some View {
        GoalCardView(goal: goal)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

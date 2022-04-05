//
//  QuestionView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 23/11/21.
//

import SwiftUI

struct QuestionView: View {
    @Binding var showOnboardingView: Bool
    
    var questions: [Questions]
    @State private var progressViewCount = 0.0
    @State private var currentQuestion = 0
    
    @State private var isAnswer1Selected = false
    @State private var isAnswer2Selected = false
    @State private var isAnswer3Selected = false
    @State private var isAnswer4Selected = false
    
    var body: some View {
        
        VStack {
            HStack {
                ProgressView(value: progressViewCount, total: 0.8)
                    .tint(Color.green)
                Image(systemName: "brain.head.profile")
            }
            .padding()
            .foregroundColor(.green)
            
            VStack {
                Text(questions[currentQuestion].title)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 350, height: 100)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray4)).shadow(radius: 3))
            }
            
            List {
                HStack {
                    if isAnswer1Selected {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.green)
                            .padding(.trailing, 10)
                    } else {
                        Circle().stroke()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                    }
                    Text(questions[currentQuestion].answer1)
                    Spacer()
                }
                .padding(.vertical, 15)
                .onTapGesture {
                    isAnswer1Selected = true
                    isAnswer2Selected = false
                    isAnswer3Selected = false
                    isAnswer4Selected = false
                }
                
                HStack {
                    if isAnswer2Selected {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.green)
                            .padding(.trailing, 10)
                    } else {
                        Circle().stroke()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                    }
                    Text(questions[currentQuestion].answer2)
                    Spacer()
                }
                .padding(.vertical, 15)
                .onTapGesture {
                    isAnswer2Selected = true
                    isAnswer1Selected = false
                    isAnswer3Selected = false
                    isAnswer4Selected = false
                }
                HStack {
                    if isAnswer3Selected {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.green)
                            .padding(.trailing, 10)
                    } else {
                        Circle().stroke()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                    }
                    Text(questions[currentQuestion].answer3)
                    Spacer()
                }
                .padding(.vertical, 15)
                .onTapGesture {
                    isAnswer3Selected = true
                    isAnswer1Selected = false
                    isAnswer2Selected = false
                    isAnswer4Selected = false
                }
                HStack {
                    if isAnswer4Selected {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.green)
                            .padding(.trailing, 10)
                    } else {
                        Circle().stroke()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                    }
                    Text(questions[currentQuestion].answer4)
                    Spacer()
                }
                .padding(.vertical, 15)
                .onTapGesture {
                    isAnswer4Selected = true
                    isAnswer1Selected = false
                    isAnswer2Selected = false
                    isAnswer3Selected = false
                }
            }
            .onAppear {
                UITableView.appearance().isScrollEnabled = false
            }
            
            Button(
                action: {
                    if progressViewCount == 0.7 {
                        
                    } else {
                        progressViewCount += 0.1
                        currentQuestion += 1
                        isAnswer1Selected = false
                        isAnswer2Selected = false
                        isAnswer3Selected = false
                        isAnswer4Selected = false
                    }
                }) {
                    if progressViewCount == 0.7 {
                        NavigationLink(destination: TestCompleted(showOnboardingView: $showOnboardingView)) {
                            Text("Submit answers")
                                .foregroundColor(Color.white)
                                .frame(width: 350.0, height: 50.0)
                        }
                    } else {
                        Text("Next")
                            .foregroundColor(Color.white)
                            .frame(width: 350.0, height: 50.0)
                    }
                }
                .background(!isAnswer1Selected && !isAnswer2Selected && !isAnswer3Selected && !isAnswer4Selected ? Color.gray : Color.green)
                .cornerRadius(10)
                .disabled(!isAnswer1Selected && !isAnswer2Selected && !isAnswer3Selected && !isAnswer4Selected)
            
            Spacer()
        }
        .background(Color(UIColor.systemGray6))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(showOnboardingView: $showOnboardingView, questions: Questions.data)
//    }
//}

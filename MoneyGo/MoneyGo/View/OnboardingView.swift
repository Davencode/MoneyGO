//
//  OnboardingView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 23/11/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboardingView: Bool
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack {
                    Text("Welcome to")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack (spacing: 0){
                        Text("Money")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                        Text("Go")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
                .padding(.bottom, 60)
                
                HStack {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .font(.system(size: 30))
                        .foregroundColor(.green)
                    VStack (alignment: .leading) {
                        Text("Personality Quiz")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Discover your money personality through a quick simple test.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "target")
                        .imageScale(.large)
                        .font(.system(size: 30))
                        .foregroundColor(.green)
                    VStack (alignment: .leading) {
                        Text("Financial Goals")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Set your goals and give them priority, stick to the plan and reach your objectives.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 60)
                
                
                //                NavigationLink(destination: Survey1()) {
                //                    Text("Start quiz")
                //                .foregroundColor(Color.white)
                //                        .frame(width: 350.0, height: 50.0)
                //
                //                }
                //                .background(Color.green)
                //                .cornerRadius(10)
                
                //                .navigationBarHidden(true)
                //                .navigationBarBackButtonHidden(true)
                
                Button(action: {}) {
                    NavigationLink(destination: QuestionView(showOnboardingView: $showOnboardingView, questions: Questions.data)) {
                        Text("Start quiz")
                            .foregroundColor(Color.white)
                            .frame(width: 350.0, height: 50.0)
                        
                    }
                }
                .background(Color.green)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}

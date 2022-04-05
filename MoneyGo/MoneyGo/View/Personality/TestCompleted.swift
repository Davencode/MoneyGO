//
//  TestCompleted.swift
//  ProgressBar
//
//  Created by Davide Belardi on 22/11/21.
//

import SwiftUI

struct TestCompleted: View {
    
    @Binding var showOnboardingView: Bool
    
    @State private var progress = 0.0
    let screen = UIScreen.main.bounds
    
    @State var countDownTimer = 1
    @State var timeRunning = true
    let timer = Timer.publish(every: 0.000001, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                Image(systemName: "hands.sparkles")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .padding(20)
                
                Text("Congrats!")
                    .font(.system(size:30, weight: .medium))
                    .multilineTextAlignment(.center)
                
                Text("You've completed the survey.")
                    .font(.system(size:25, weight: .light))
                    .multilineTextAlignment(.center)
                //ALL ABOUT THE PROGRESS BAR
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(width: screen.width/1.2, height: 40)
                        .foregroundColor(Color.gray).opacity(0.1)
                    
                    HStack{
                        ProgressView(value: progress, total: 100.0)
                            .frame(width: screen.width/1.5, height: 20)
                            .accentColor(.green)
                            .onAppear {
                                self.runCounter(counter: self.$progress, start: 0.1, end: 1.0, speed: 0.01)
                            }
                        
                    }.frame(width: screen.width/1.4, height: 20, alignment: .leading)
                    
                    HStack{
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.green)
                    }.frame(width: screen.width/1.3, height: 20, alignment: .trailing)
                    
                }
                //FINISH PROGRESS BAR ZONE
                
                Text("\(countDownTimer)" + "%")
                    .font(.system(size:30, weight: .bold))
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timeRunning {
                            countDownTimer += 1
                        }
                        
                        if countDownTimer == 100 {
                            timeRunning = false
                        }
                    }
                
                Button(action: {
                    showOnboardingView = false
                }) {
                    Text("Check my personality profile")
                        .foregroundColor(Color.white)
                        .frame(width: 350.0, height: 50.0)
                    
                }
                .background(Color.green)
                .cornerRadius(10)
                
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: 0, y : -200)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: 0, y : -200)
                }
                
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func runCounter(counter: Binding<Double>, start: Double, end: Double, speed: Double) {
        counter.wrappedValue = start
        
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            counter.wrappedValue += 1.0
            if counter.wrappedValue == end {
                timer.invalidate()
            }
        }
    }
}

struct FireworkParticlesGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}


struct ParticlesModifier: ViewModifier {
    @State var time = 0.10
    @State var scale = 0.1
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<80, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}



//struct TestCompleted_Previews: PreviewProvider {
//    static var previews: some View {
//        TestCompleted()
//    }
//}



//Button(action: {
//    showOnboardingView = false
//}) {
//    Text("Check my personality profile")
//        .foregroundColor(Color.white)
//        .frame(width: 350.0, height: 50.0)
//
//}
//.background(Color.green)
//.cornerRadius(10)

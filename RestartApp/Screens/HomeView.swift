//
//  HomeView.swift
//  RestartApp
//
//  Created by Besh P.Yogi on 27.10.22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 20){// START: VStack
                //MARK: - HEADER
                Spacer()
                ZStack{
                    CricleGroupView(ShapeColor: .red, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 4)
                                .repeatForever()
                            , value: isAnimating
                        )
                }//:ZS
                //MARK: -CENTER
                Text("The time that leads to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //MARK: -FOOTER
                Spacer()
                Button(action: {
                    withAnimation{
                        playSound(sound: "success", type: ".m4a")
                        isOnboardingViewActive = true
                    }
                    
                }) {
                    HStack{
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        Text("Restart")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }// END: VStack
            .onAppear(perform: {
                // animating using durantion
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }//ZStack
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       HomeView()
    }
}

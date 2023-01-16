//
//  CricleGroupView.swift
//  RestartApp
//
//  Created by Besh P.Yogi on 13.01.23.
//

import SwiftUI

struct CricleGroupView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//:ZS
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CricleGroupView_Previews: PreviewProvider{
    static var previews: some View{
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CricleGroupView(ShapeColor: .white, ShapeOpacity: 0.3)
        }
    }
}

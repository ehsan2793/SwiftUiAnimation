//
//  AnimatingCircle.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/10/23.
//

import SwiftUI

struct AnimatingCircle: View {
    // MARK: - PROPERTIES

    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    var outerColor = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    var innerColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    // MARK: - BODY

    var body: some View {
        ZStack {
//            Rectangle()
//                .foregroundColor(.white)
//                .edgesIgnoringSafeArea(.all)
            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)

                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            } //: ZSTACK
            .opacity(0.5)

            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)

                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            } //: ZSTACK
            .opacity(0.5)
            .rotationEffect(.degrees(60))

            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)

                Circle().fill(LinearGradient(gradient: Gradient(colors: [outerColor, innerColor]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            } //: ZSTACK
            .opacity(0.5)
            .rotationEffect(.degrees(120))
            
        } //: ZSTACK
        .rotationEffect(.degrees(rotateInOut ? 120 : 0))
        .scaleEffect(scaleInOut ? 1 : 1 / 4)
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    
          

    }
}

// MARK: PREVIEW

struct AnimatingCircle_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingCircle()
    }
}

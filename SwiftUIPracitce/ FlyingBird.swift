//
//   FlyingBird.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/13/23.
//

import SwiftUI

struct FlyingBird: View {
    // MARK: - PROPERTIES

    @State private var leftWing = false
    @State private var rightWing = false
    @State private var birdBody = false
    @State private var animateShadow = false

    // MARK: - BODY

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ZStack {
                // MARK: - LEFT WING

                Image("leftWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.red, radius: 1, x: 0, y: -3)
                    .rotationEffect(.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -50, y: leftWing ? -190 : 0)

                // MARK: - RIGHT WING

                Image("rightWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.blue, radius: 1, x: 0, y: -3)
                    .rotationEffect(.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x: 50, y: rightWing ? -190 : 0)

                Image("body 1")
                    .resizable()
                    .frame(width: 100, height: 150)
                    .offset(y: -30)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: birdBody ? -50 : 75)
            } //: ZSTACK
            .shadow(color: .white.opacity(0.5), radius: animateShadow ? 1 : 4, x: 0, y: animateShadow ? 10 : 1)

            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    leftWing.toggle()
                    rightWing.toggle()
                    birdBody.toggle()
                    animateShadow.toggle()
                }
            }
        }
    }
}

// MARK: PREVIEW

struct FlyingBird_Previews: PreviewProvider {
    static var previews: some View {
        FlyingBird()
    }
}

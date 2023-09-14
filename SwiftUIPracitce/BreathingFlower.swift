//
//  BreathingFlower.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/12/23.
//

import SwiftUI

struct BreathingFlower: View {
    // MARK: - PROPERTIES

    @State private var petal = false
    @State private var showShadow = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var breath = false
    @State private var diffuseOnExhale = false
    @State private var degrees: CGFloat = 0.0
    let backGroundColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    // MARK: - BODY

    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            ZStack {
                Text("Breath In")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color.green)
                    .opacity(breathInLabel ? 0 : 1)
                    .scaleEffect(breathInLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)

                Text("Breath Out")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color.green)
                    .opacity(breathOutLabel ? 0 : 1)
                    .scaleEffect(breathOutLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)

                VStack {
                    ZStack {
                        // MARK: - BREATH

                        VStack {
                            Image("breath")
                                .resizable()
                                .frame(width: 35, height: 125)
                                .offset(y: breath ? 90 : 0)
                            .animation(Animation.timingCurve(0.65, -2.6, 0.32, 0.4).delay(0.05).speed(0.1).repeatForever(autoreverses: true), value: breath)
                        }
                        .blur(radius: diffuseOnExhale ? 1 : 50)
                        
                        
                        Petal(petal: $petal, degrees: petal ? -25 : -5)
                        Petal(petal: $petal, degrees: degrees)
                        Petal(petal: $petal, degrees: petal ? 25 : 5)
                        Petal(petal: $petal, degrees: petal ? -50 : -10)
                            .offset(y: -10)
                        Petal(petal: $petal, degrees: petal ? 50 : 10)

                        Image("bottomFlowers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                            .rotationEffect(.degrees(37))
                            .offset(x: -25, y: 90)

                        Image("bottomFlowers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                            .rotationEffect(.degrees(32))
                            .offset(x: -20, y: 190)
                    } //: ZSTACK
                    
                    .offset(x: 0, y: diffuseOnExhale ? -25 : -5)
                    
                
                } //: VSTACK

                // MARK: - PETALS

//                Petal(petal: $petal, degrees: petal ? -25 : -5)
//                Petal(petal: $petal, degrees: degrees)
//                Petal(petal: $petal, degrees: petal ? 25 : 5)
//                Petal(petal: $petal, degrees: petal ? -50 : -10)
//                    .offset(y: -10)
//                Petal(petal: $petal, degrees: petal ? 50 : 10)
//
//                Image("bottomFlowers")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 400)
//                    .rotationEffect(.degrees(37))
//                    .offset(x: -25, y: 90)
//
//                Image("bottomFlowers")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 400)
//                    .rotationEffect(.degrees(32))
//                    .offset(x: -20, y: 190)
            } //: ZSTACK

            .shadow(radius: showShadow ? 10 : 0)
            .hueRotation(Angle(degrees: showShadow ? 0 : 180))
            .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: showShadow)
            .onAppear {
                breathInLabel.toggle()
                breathOutLabel.toggle()
                breath.toggle()
                diffuseOnExhale.toggle()
                showShadow.toggle()
                petal.toggle()
            }
        }
    }
}

// MARK: PREVIEW

struct BreathingFlower_Previews: PreviewProvider {
    static var previews: some View {
        BreathingFlower()
    }
}

struct Petal: View {
    @Binding var petal: Bool
    var degrees: Double = 0
    var body: some View {
        Image("flower")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

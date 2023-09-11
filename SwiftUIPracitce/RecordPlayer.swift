//
//  RecordPlayer.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/10/23.
//

import SwiftUI

struct RecordPlayer: View {
    // MARK: - PROPERTIES

    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degree = 0.0

    // MARK: - BODY

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, startRadius: 20, endRadius: 600)
                .edgesIgnoringSafeArea(.all)

            RecordPlayerBox()
                .offset(y: -100)

            VStack {
                Record(degrees: $degree, shoudAnimate: $shouldAnimate)
//                    .offset(y: -100)
                Arm(rotateArm: $rotateArm)

                Button {
                    shouldAnimate.toggle()
                    if shouldAnimate {
                        degree = 3600
                        rotateArm = true
                        playSound(sound: "music", type: "m4a")
                    } else {
                        rotateArm.toggle()
                        degree = 0
                        audioPlayer?.stop()
                    }
                } label: {
                    HStack {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    } //: HSTACK
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().stroke(Color.black, lineWidth: 1.25))
                    .foregroundColor(.black)
                }
            }
        }
    }
}

// MARK: PREVIEW

struct RecordPlayer_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayer()
    }
}

// MARK: - RecordPlayerBox

struct RecordPlayerBox: View {
    var body: some View {
        Image("woodGrain")
            .resizable()
            .frame(width: 325, height: 325)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 10)
            }
    }
}

// MARK: - Record

struct Record: View {
    @Binding var degrees: Double
    @Binding var shoudAnimate: Bool

    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 2)
            .rotationEffect(Angle.degrees(degrees))
            .animation(Animation.linear(duration: shoudAnimate ? 60 : 0).delay(1.5), value: shoudAnimate)
    }
}

struct Arm: View {
    @Binding var rotateArm: Bool
    var body: some View {
        Image("playerArm")
            .resizable()
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(Angle(degrees: -35), anchor: .topTrailing)
            .rotationEffect(Angle(degrees: rotateArm ? 10 : 0), anchor: .top)
            .animation(Animation.linear(duration: 2), value: rotateArm)
            .offset(x: 70, y: -250)
    }
}

//
//  ContentView.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimatingCircle()
                .tabItem {
                    VStack {
                        Image(systemName: "line.3.crossed.swirl.circle.fill")
                        Text("Animating Circle")
                    }
                    .foregroundColor(.black)
                }
            RecordPlayer()
                .tabItem {
                    Image(systemName: "record.circle.fill")
                    Text("Record Player")
                }
                .foregroundColor(.black)

            HueRotation()
                .tabItem {
                    Image(systemName: "photo.circle")
                    Text("Hue Rotation")
                   
                }
            
            
            BreathingFlower()
                .tabItem {
                   Image(systemName: "tree.circle.fill")
                    Text("Hue Rotation")
                }
            
            FlyingBird()
                .tabItem {
                    Image(systemName: "bird.fill")
                    Text("Hue Rotation")
                }
            DodgeBall()
                .tabItem {
                    Image(systemName: "baseball.fill")
                    Text("Dodge Ball")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

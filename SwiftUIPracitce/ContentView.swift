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
                    HStack {
                            Image(systemName: "circle.fill")
                            Text("Animating Circle")
                        }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

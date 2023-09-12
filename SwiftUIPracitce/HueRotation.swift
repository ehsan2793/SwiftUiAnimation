//
//  HueRotation.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/11/23.
//

import SwiftUI

struct HueRotation: View {
    // MARK: - PROPERTIES

    @State private var shiftColors = false
    @State private var image = "dog"
    let backgroundColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    // MARK: - BODY

    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350)
                    .hueRotation(Angle(degrees: shiftColors ? 360 * 2 : 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true), value: shiftColors)
                    .onAppear {
                        shiftColors.toggle()
                    }
            }
            ImagePicker(selectedImage: $image)
        }
        .background(Color.black)
    }
}

// MARK: PREVIEW

struct HueRotation_Previews: PreviewProvider {
    static var previews: some View {
        HueRotation()
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: String
    let images = ["ornament", "landscape", "dog", "dice", "cat"]
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { name in
                Text("\(name)")
                    .foregroundColor(.white)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 0, y: 0)
    }
}

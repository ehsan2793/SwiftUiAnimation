//
//  PlaySound.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/10/23.
//

import AVFoundation
import Foundation
var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch  {
            print("no audio found")
        }
    }
}

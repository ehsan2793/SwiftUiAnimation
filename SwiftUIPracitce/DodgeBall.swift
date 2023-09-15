//
//  DodgeBall.swift
//  SwiftUIPracitce
//
//  Created by Ehsan Rahimi on 9/14/23.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesBegan(touches, with: event)
       
    }
}

struct DodgeBall: View {
    // MARK: - PROPERTIES

    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return scene
    }

    // MARK: - BODY

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.white.opacity(0.8), .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            VStack {
                SpriteView(scene: scene)
//                    .frame(width: 320, height: 320)
            }
        }
    }
}

// MARK: PREVIEW

struct DodgeBall_Previews: PreviewProvider {
    static var previews: some View {
        DodgeBall()
    }
}

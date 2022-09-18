//
//  GameScene.swift
//  Level Game
//
//  Created by ROY ALAMEH on 9/18/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var startNode:SKLabelNode!
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        startNode = self.childNode(withName: "startButton") as? SKLabelNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let nodesArray = self.nodes(at: touch.location(in: self))
            if nodesArray.count > 0 && nodesArray[0].name == "startButton" {
                self.view?.presentScene(GameScene(fileNamed: "Level1")!, transition: SKTransition.flipVertical(withDuration: 0.5))
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

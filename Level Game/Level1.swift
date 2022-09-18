//
//  Level1.swift
//  Level Game
//
//  Created by ROY ALAMEH on 9/18/22.
//

import SpriteKit
import GameplayKit

class Level1: SKScene, SKPhysicsContactDelegate {
    var player:SKShapeNode!
    var playerSize = 30.0
    var playerSpeed = 200.0
    
    var up:SKLabelNode!
    var down:SKLabelNode!
    var right:SKLabelNode!
    var left:SKLabelNode!
    
    var mainMenu:SKLabelNode!
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        player = SKShapeNode(circleOfRadius: playerSize)
        player.fillColor = UIColor.green
        player.physicsBody = SKPhysicsBody(circleOfRadius: playerSize)
        player.physicsBody?.affectedByGravity = false
        player.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        self.addChild(player)
        
        up = self.childNode(withName: "upButton") as? SKLabelNode
        down = self.childNode(withName: "downButton") as? SKLabelNode
        right = self.childNode(withName: "rightButton") as? SKLabelNode
        left = self.childNode(withName: "leftButton") as? SKLabelNode
        
        mainMenu = self.childNode(withName: "mainMenuButton") as? SKLabelNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let nodesArray = self.nodes(at: touch.location(in: self))
            if nodesArray.count > 0 {
                if (nodesArray[0].name == "upButton") {
                    player.physicsBody?.velocity = CGVector(dx: 0, dy: playerSpeed)
                }
                else if (nodesArray[0].name == "downButton") {
                    player.physicsBody?.velocity = CGVector(dx: 0, dy: -playerSpeed)
                }
                else if (nodesArray[0].name == "rightButton") {
                    player.physicsBody?.velocity = CGVector(dx: playerSpeed, dy: 0)
                }
                else if (nodesArray[0].name == "leftButton") {
                    player.physicsBody?.velocity = CGVector(dx: -playerSpeed, dy: 0)
                }
                else if (nodesArray[0].name == "mainMenuButton") {
                    self.view?.presentScene(SKScene(fileNamed: "GameScene")!, transition: SKTransition.doorsCloseHorizontal(withDuration: 0.5))
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let nodesArray = self.nodes(at: touch.location(in: self))
            if nodesArray.count > 0 {
                if (nodesArray[0].name == "upButton") {
                    player.physicsBody?.velocity = CGVector(dx: 0, dy: playerSpeed)
                }
                else if (nodesArray[0].name == "downButton") {
                    player.physicsBody?.velocity = CGVector(dx: 0, dy: -playerSpeed)
                }
                else if (nodesArray[0].name == "rightButton") {
                    player.physicsBody?.velocity = CGVector(dx: playerSpeed, dy: 0)
                }
                else if (nodesArray[0].name == "leftButton") {
                    player.physicsBody?.velocity = CGVector(dx: -playerSpeed, dy: 0)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


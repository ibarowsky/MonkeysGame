//
//  Ostacolo.swift
//  gioco
//
//  Created by Vincenzo Versi on 21/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit

class Ostacolo {
    
    private var minX = Float(2000), maxX = Float(3000)
    
    func randomBetweenNumbers(firstNum: Int,secondNum: Int) -> Int {
        return Int.random(in: firstNum...secondNum)
    }
    
    func spawnItems(camera: SKCameraNode) -> SKSpriteNode {
        
        let item: SKSpriteNode?
        
        item = SKSpriteNode(imageNamed: "scimmia-static")
        item?.name = "ostacolo"
        item?.size = CGSize(width: 200, height: 200)
        item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size)
        
        
        item!.physicsBody?.affectedByGravity = true;
//        item!.physicsBody?.collisionBitMask = ColliderType.GROUND
        item?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
        
        
        item?.zPosition = 5;
        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item?.position.x = camera.position.x + CGFloat(randomBetweenNumbers(firstNum: Int(minX), secondNum: Int(maxX)))
//        item?.position.y = randomBetweenNumbers(firstNum: minY, secondNum: maxY)/
        item?.position.y = -380
        return item!
    }
    
//    func spawnSequence(camera: SKCameraNode) -> SKSpriteNode {
//        let sequence: SKSpriteNode?
//
//        sequence = SKSpriteNode(imageNamed: "Seq-1")
//        sequence?.name = "sequenza1"
//        sequence?.position.x = item.position.x
//
//
//        return sequence!
//    }
}

//
//  Ostacolo.swift
//  gioco
//
//  Created by Vincenzo Versi on 21/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit

class Ostacolo {
    
    private var minY = CGFloat(72), maxY = CGFloat(600);
    
    func randomBetweenNumbers(firstNum: CGFloat,secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs (firstNum - secondNum) + min(firstNum, secondNum);
    }
    
    func spawnItems(camera: SKCameraNode) -> SKSpriteNode {
        
        let item: SKSpriteNode?;
        
        
            item = SKSpriteNode(imageNamed: "scimmia-static")
            item?.name = "ostacolo"
            item?.size = CGSize(width: 200, height: 200)
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size)
        
        
        item!.physicsBody?.affectedByGravity = true;
//        item!.physicsBody?.collisionBitMask = ColliderType.GROUND
        item?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
        
        
//        item?.zPosition = 4;
        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item?.position.x = camera.position.x + 1100
//        item?.position.y = randomBetweenNumbers(firstNum: minY, secondNum: maxY);
//        item?.position.y = camera.position.y + 500
        return item!
    }
}

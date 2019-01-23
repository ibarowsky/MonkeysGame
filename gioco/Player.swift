//
//  player.swift
//  gioco
//
//  Created by Vincenzo Versi on 18/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit

struct ColliderType {
    static let PLAYER: UInt32 = 0
    static let GROUND: UInt32 = 1
    static let JUNK_AND_COLLECTABLES: UInt32 = 2
}


class Player: SKSpriteNode {
    
    private var playerAnimation = [SKTexture]();
    private var animatePlayerAction = SKAction();

    func initializePlayer() {
        playerAnimation.removeAll()
        
        for i in 1...4 {
            let name = "scimmia-\(i)";
            playerAnimation.append(SKTexture(imageNamed: name));
        }
    
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.5, resize: false, restore: true);
    
    
    self.run(SKAction.repeatForever(animatePlayerAction))
        
        physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        physicsBody?.affectedByGravity = true;
        physicsBody?.allowsRotation = false;
        physicsBody?.restitution = 0;
        physicsBody?.categoryBitMask = ColliderType.PLAYER;
        physicsBody?.collisionBitMask = ColliderType.GROUND;
        physicsBody?.contactTestBitMask = ColliderType.JUNK_AND_COLLECTABLES;
    }
    
    func move(camera: CGFloat) {
        
            self.position.x += 13;
        
    }
    
}

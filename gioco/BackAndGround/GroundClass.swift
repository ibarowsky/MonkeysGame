//
//  GroundClass.swift
//  gioco
//
//  Created by Vincenzo Versi on 21/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit

class GroundClass: SKSpriteNode {
    func initializeGroundAndFloor(){
        physicsBody = SKPhysicsBody(rectangleOf: self.size);
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.GROUND;
    }
    
    func moveGrounds(camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x {
            self.position.x += self.size.width * 3;
        }
    }
}

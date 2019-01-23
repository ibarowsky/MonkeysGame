//
//  BackClass.swift
//  gioco
//
//  Created by Vincenzo Versi on 21/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit

class BackClass: SKSpriteNode {
    func moveBG(camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x {
            self.position.x += self.size.width * 3;
        }
    }
}

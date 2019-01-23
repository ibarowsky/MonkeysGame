//
//  GameScene.swift
//  gioco
//
//  Created by Vincenzo Versi on 18/01/19.
//  Copyright © 2019 Vincenzo Versi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var node: SKSpriteNode?
    
    private var player: Player?

    private var mainCamera: SKCameraNode?;
    
    private var back1: BackClass?;
    private var back2: BackClass?;
    private var back3: BackClass?;
    
    private var ostacolo = Ostacolo()

    private var ground1: GroundClass?;
    private var ground2: GroundClass?;
    private var ground3: GroundClass?;
    
    var gameOver = false

//
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
//
    override func didMove(to view: SKView) {
         initializeGame();
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
  }
    
    override func update(_ currentTime: TimeInterval){
        
        manageCamera();
        
        manageBGsAndGrounds();

        player?.move(camera: mainCamera!.position.x)
    }
//
//    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
//        guard let press = presses.first else { return }
//
//        if press.type == .playPause {
//
//            print("tasto play")
//
//            if let player = self.childNode(withName: "pg") {
//                print("c'è")
//                player.run(SKAction.move(to: CGPoint(x: player.position.x + 50, y: player.position.y + 0), duration: 0.2))
//            }
//        }
//    }
    //
    //        else if press.type  == .select {
    //            for press in presses {
    //                if press.type == .select {
    //                    if let player = self.childNode(withName: "pg") {
    //                        let minX: CGFloat = -160
    //                        let multiplier: CGFloat = 10
    //                        let force = max(0, (player.position.x / minX - 1) * multiplier)
    //                        player.physicsBody?.applyImpulse(CGVector(dx: -force, dy: 0))
    //                    }
    //                }
    //                        else {
    //                    super.pressesEnded(presses, with: event)
    //                }
    //            }
    //        }
    //    }
    //    func quitGame(){
    //        print("Quit")
    //    }
    
    
//    override func update(_ currentTime: TimeInterval){
    
//        if fitRun?.physicsBody?.velocity.dy == 0  {
//            ableToJump = true
//        }
//        else {
//            ableToJump = false
//        }
//        if status > 19 && status <= 25 {
//            score += 1
//        }
//        ScoreNum?.text = String(score);
        
//        if player!.position.x < self.mainCamera!.position.x - self.scene!.frame.width / 2{
//            fitRun?.removeFromParent()
//
//            gameOver = true
//        }
//        if gameOver == true {
//            gameover();
//        }
//
//        manageCamera();
//        manageBGsAndGrounds();
//
//        fitRun?.move(status: status, camera: mainCamera!.position.x);
//
//    }

    private func initializeGame(){
        physicsWorld.contactDelegate = self
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
        
        player = childNode(withName: "player") as? Player
        
        back1 = childNode(withName: "back1") as? BackClass;
        back2 = childNode(withName: "back2") as? BackClass;
        back3 = childNode(withName: "back3") as? BackClass;
        
        
        ground1 = childNode(withName: "ground1") as? GroundClass;
        ground2 = childNode(withName: "ground2") as? GroundClass;
        ground3 = childNode(withName: "ground3") as? GroundClass;
        
        ground1?.initializeGroundAndFloor()
        ground2?.initializeGroundAndFloor()
        ground3?.initializeGroundAndFloor()
        
        player?.initializePlayer()
        
        Timer.scheduledTimer(timeInterval: TimeInterval(ostacolo.randomBetweenNumbers(firstNum: 1.5, secondNum: 1.5)), target: self, selector: #selector(GameScene.spawnItems), userInfo: nil, repeats: true);
    }
    
    @objc func handleSwipe(sender: UIGestureRecognizer) {
        if let gesture = sender as? UISwipeGestureRecognizer {
            switch(gesture.direction) {
            case UISwipeGestureRecognizer.Direction.right: print("right")
            case UISwipeGestureRecognizer.Direction.left: print("left")
            case UISwipeGestureRecognizer.Direction.up: print("up")
            case UISwipeGestureRecognizer.Direction.down: print("down")
            default:
                break
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "ostacolo"{
//            gameover()
        }
    }
    
    func gameover(){
        if let scene = GameOver(fileNamed: "GameOver") {
            // Set the scale mode to scale to fit the window
//            scene.scaleMode = .aspectFill
            
            // Present the scene
            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
        }
    }
    
    
    private func manageCamera(){
        self.mainCamera?.position.x += 13
    }
    
    private func manageBGsAndGrounds() {
        back1?.moveBG(camera: mainCamera!);
        back2?.moveBG(camera: mainCamera!);
        back3?.moveBG(camera: mainCamera!);
        
        ground1?.moveGrounds(camera: mainCamera!);
        ground2?.moveGrounds(camera: mainCamera!);
        ground3?.moveGrounds(camera: mainCamera!);
        }
    
    @objc private func spawnItems() {
        self.scene?.addChild(ostacolo.spawnItems(camera: mainCamera!))
    }
    
    
}


//
//  GameViewController.swift
//  Swiftris
//
//  Created by Simone Gonzalez on 6/23/17.
//  Copyright (c) 2017 Simone Gonzalez. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, SwiftrisDelegate {

    var scene: GameScene!
    var swiftris:Swiftris!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure the view
        let skView = view as! SKView
        
        skView.multipleTouchEnabled = false
        
        //create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        
        swiftris = Swiftris()
        
        swiftris.delegate = self
        
        swiftris.beginGame()
        
        //present the scene
        skView.presentScene(scene)
        
        
    }
    
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func didTick() {
        
        swiftris.letShapeFall()
        
    }
    
    func nextShape() {
        let newShapes = swiftris.newShape()
        
        guard let fallingShape = newShapes.fallingShape else {
            return
        }
        self.scene.addPreviewShapeToScene(newShapes.nextShape!) {}
        
        self.scene.movePreviewShape(fallingShape) {
            self.view.userInteractionEnabled = true
            
            self.scene.startTicking()
        }
    }
    
    func gameDidBegin(swiftris: Swiftris) {
        if swiftris.nextShape != nil && swiftris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(swiftris.nextShape!) {
                self.nextShape()
            }
        } else {
                nextShape()
        }
    }
    
    func gameDidEnd(swiftris: Swiftris) {
        view.userInteractionEnabled = false
            
        scene.stopTicking()
            
        nextShape()
    }
    
    func gameDidLevelUp(swiftris: Swiftris) {
        
    }
    
    func gameShapeDidDrop(swiftris: Swiftris) {
        
    }
    
    func gameShapeDidLand(swiftris: Swiftris) {
        scene.stopTicking()
        
        nextShape()
    }
        
    func gameShapeDidMove(swiftris: Swiftris) {
        scene.redrawShape(swiftris.fallingShape!){}
    }
    
}

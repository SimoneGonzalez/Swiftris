//
//  GameViewController.swift
//  Swiftris
//
//  Created by Simone Gonzalez on 6/23/17.
//  Copyright (c) 2017 Simone Gonzalez. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure the view
        let skView = view as! SKView
        
        skView.multipleTouchEnabled = false
        
        //create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        
        scene.scaleMode = .AspectFill
        
        //present the scene
        skView.presentScene(scene)
    }
    
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
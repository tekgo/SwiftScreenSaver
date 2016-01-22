//
//  SwiftScreenSaverView.swift
//  SwiftScreenSaver
//
//  Created by Patrick Winchell on 1/22/16.
//  Copyright © 2016 Patrick Winchell. All rights reserved.
//

import Cocoa
import ScreenSaver
import SpriteKit

class SwiftScreenSaverView: ScreenSaverView {
    
    var spriteView: GameView

    override init?(frame: NSRect, isPreview: Bool) {
        self.spriteView = GameView(frame: frame)
        self.spriteView.ignoresSiblingOrder = true;
        self.spriteView.showsFPS = false;
        self.spriteView.showsNodeCount = false;
        let scene = GameScene()
        scene.size = frame.size;
        scene.scaleMode = .AspectFit;
        scene.backgroundColor = SKColor.blackColor()
        
        
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1.0
        self.addSubview(self.spriteView)
        self.spriteView.presentScene(scene)
        
    }

    required init?(coder: NSCoder) {
        self.spriteView = GameView(frame: NSRect.zero)
        self.spriteView.ignoresSiblingOrder = true;
        self.spriteView.showsFPS = false;
        self.spriteView.showsNodeCount = false;
        let scene = GameScene()
        scene.size = CGSize.zero;
        scene.scaleMode = .AspectFit;
        scene.backgroundColor = SKColor.blackColor()
        self.spriteView.presentScene(scene)
        
        
        super.init(coder: coder)
        self.animationTimeInterval = 1.0 / 30.0
        self.addSubview(self.spriteView)
    }
    
    override var frame: NSRect {
        didSet
        {
            self.spriteView.frame = frame
        }
    }
    
}

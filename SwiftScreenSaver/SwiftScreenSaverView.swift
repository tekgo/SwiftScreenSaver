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
    
    var spriteView: GameView?

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1.0
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.animationTimeInterval = 1.0
    }
    
    override var frame: NSRect {
        didSet
        {
            self.spriteView?.frame = frame
        }
    }
    
    override func startAnimation() {
        if self.spriteView == nil {
            let spriteView = GameView(frame: self.frame)
            spriteView.ignoresSiblingOrder = true;
            spriteView.showsFPS = false;
            spriteView.showsNodeCount = false;
            let scene = GameScene()
            scene.size = frame.size;
            scene.scaleMode = .AspectFit;
            scene.backgroundColor = SKColor.blackColor()
            self.spriteView = spriteView
            addSubview(spriteView)
            spriteView.presentScene(scene)
        }
        super.startAnimation()
    }
    
}

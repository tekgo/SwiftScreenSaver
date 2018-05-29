//
//  GameScene.swift
//  SwiftScreenSaver
//
//  Created by Patrick Winchell on 1/22/16.
//  Copyright © 2016 Patrick Winchell. All rights reserved.
//

import SpriteKit
import Cocoa

class GameScene: SKScene
{
    
    override var acceptsFirstResponder: Bool { return false }
	
    override func didMove(to view: SKView)
	{
        self.resignFirstResponder()
        self.isUserInteractionEnabled=false
    }
	
	
    override func update(_ currentTime: TimeInterval)
	{
		self.backgroundColor = NSColor(calibratedHue: 0.0, saturation: 0.0, brightness: CGFloat(0.5 + (sin(currentTime) * 0.5)), alpha: 1.0)
    }
    
    func getImage(_ name: String) -> NSImage?
    {
        if let image = NSImage(named: NSImage.Name(rawValue: name))
        {
            return image
        }
        
        let bundle = Bundle(for: GameScene.self)
        if let path = bundle.path(forResource: name, ofType: "png")
        {
            return NSImage(contentsOfFile: path)
        }
        
        return nil
    }
}

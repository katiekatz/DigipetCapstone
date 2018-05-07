//
//  LessonRow.swift
//  Digipet
//
//  Created by Katie Katz on 12/21/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

public class LessonRow: SKSpriteNode {
    
    var petImg: SKSpriteNode!
    var border: SKShapeNode!
    var lessonName : SKLabelNode!
    var startButton : SKShapeNode!
    var startText : SKLabelNode!
    var infoButton : SKShapeNode!
    var infoText : SKLabelNode!
    public var startCover : SKShapeNode!
    var infoCover : SKShapeNode!

    
    
    init(size: CGSize, y: CGFloat, petName: String, lN: String){
        
        super.init(texture: nil, color: .clear, size: size)
        self.anchorPoint.y = 0;
        self.position = CGPoint(x: 0, y: y)
        
        petImg = SKSpriteNode(texture: SKTexture(imageNamed: petName), size: CGSize(width: 150, height: 210))
        petImg.anchorPoint = CGPoint(x: 0, y: 0)
        petImg.position = CGPoint(x: -325, y: 18)
        self.addChild(petImg)
        
        border = SKShapeNode(rect: CGRect(x: -360, y: 0, width: 720, height: 5))
        border.fillColor = .black
        self.addChild(border)
        
        lessonName = SKLabelNode(text: lN)
        lessonName.fontName = "Plumpfull"
        lessonName.fontSize = 55
        lessonName.fontColor = .black
        lessonName.horizontalAlignmentMode = .left
        lessonName.position = CGPoint(x: -150, y: 150)
        self.addChild(lessonName)
        
        startButton = SKShapeNode(rect: CGRect(x: -145, y: 55, width: 200, height: 50), cornerRadius: 25)
        startButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        startButton.strokeColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
        startButton.lineWidth = 4.0
        startButton.glowWidth = 0
        
        startText = SKLabelNode(text: "start")
        startText.position = CGPoint(x: -45, y: 65)
        startText.horizontalAlignmentMode = .center
        startText.fontName = "Plumpfull"
        startText.fontSize = 36
        startText.fontColor = .black
        
        self.addChild(startButton)
        self.addChild(startText)

        
        infoButton = SKShapeNode(rect: CGRect(x: 80, y: 55, width: 200, height: 50), cornerRadius: 25)
        infoButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        infoButton.strokeColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        infoButton.lineWidth = 4.0
        infoButton.glowWidth = 0
        
        infoText = SKLabelNode(text: "info")
        infoText.position = CGPoint(x: 180, y: 65)
        infoText.horizontalAlignmentMode = .center
        infoText.fontName = "Plumpfull"
        infoText.fontSize = 36
        infoText.fontColor = .black
        
        self.addChild(infoButton)
        self.addChild(infoText)
        
    }
    
    //xcode told me to do this
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

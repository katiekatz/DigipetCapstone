//
//  LessonInfoBox.swift
//  Digipet
//
//  Created by Katie Katz on 1/26/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit

public class LessonInfoBox: SKShapeNode {
    
    var border: SKShapeNode!
    var lessonName: SKLabelNode!
    var vl1: SKLabelNode!
    var vl2: SKLabelNode!
    var vl3: SKLabelNode!
    var dl1: SKLabelNode!
    var dl2: SKLabelNode!
    var dl3: SKLabelNode!
    var talkButton : SKShapeNode!
    var talkText : SKLabelNode!
    var typeButton : SKShapeNode!
    var typeText : SKLabelNode!
    var moveTo : String!
    
    public init(lN: String, v1: String, v2: String, v3: String, d1: String, d2: String, d3: String, moveTo: String){
        
        super.init()
        
        self.moveTo = moveTo
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 550))
        self.path = CGPath(roundedRect: rect, cornerWidth: 10, cornerHeight: 10, transform: nil)
        self.fillColor = .white
        self.strokeColor = .black
        self.glowWidth = 0
        self.lineWidth = 8.0
        
        let lI = SKLabelNode(text: "LESSON INFO")
        lI.fontName = "Plumpfull"
        lI.fontColor = .black
        lI.fontSize = 57
        lI.horizontalAlignmentMode = .left
        lI.position = CGPoint(x: 25, y: 475)
        self.addChild(lI)
        
        border = SKShapeNode(rect: CGRect(x: 25, y: 460, width: 550, height: 8))
        border.fillColor = .black
        self.addChild(border)
        
        lessonName = SKLabelNode(text: lN)
        lessonName.fontName = "Plumpfull"
        lessonName.fontColor = .black
        lessonName.fontSize = 36
        lessonName.horizontalAlignmentMode = .left
        lessonName.position = CGPoint(x: 25, y: 410)
        self.addChild(lessonName)
        
        let vH = SKLabelNode(text: "Vocab Highlights:")
        vH.fontName = "Plumpfull"
        vH.fontColor = .black
        vH.fontSize = 30
        vH.horizontalAlignmentMode = .left
        vH.position = CGPoint(x: 25, y: 350)
        self.addChild(vH)
        
        vl1 = SKLabelNode(text: v1)
        vl1.fontName = "Plumpfull"
        vl1.fontColor = .black
        vl1.fontSize = 24
        vl1.horizontalAlignmentMode = .left
        vl1.position = CGPoint(x: 25, y: 320)
        self.addChild(vl1)
        
        vl2 = SKLabelNode(text: v2)
        vl2.fontName = "Plumpfull"
        vl2.fontColor = .black
        vl2.fontSize = 24
        vl2.horizontalAlignmentMode = .left
        vl2.position = CGPoint(x: 25, y: 290)
        self.addChild(vl2)
        
        vl3 = SKLabelNode(text: v3)
        vl3.fontName = "Plumpfull"
        vl3.fontColor = .black
        vl3.fontSize = 24
        vl3.horizontalAlignmentMode = .left
        vl3.position = CGPoint(x: 25, y: 260)
        self.addChild(vl3)
        
        let gD = SKLabelNode(text: "Game Description:")
        gD.fontName = "Plumpfull"
        gD.fontColor = .black
        gD.fontSize = 30
        gD.horizontalAlignmentMode = .left
        gD.position = CGPoint(x: 25, y: 210)
        self.addChild(gD)
        
        dl1 = SKLabelNode(text: d1)
        dl1.fontName = "Plumpfull"
        dl1.fontColor = .black
        dl1.fontSize = 24
        dl1.horizontalAlignmentMode = .left
        dl1.position = CGPoint(x: 25, y: 180)
        self.addChild(dl1)
        
        dl2 = SKLabelNode(text: d2)
        dl2.fontName = "Plumpfull"
        dl2.fontColor = .black
        dl2.fontSize = 24
        dl2.horizontalAlignmentMode = .left
        dl2.position = CGPoint(x: 25, y: 150)
        self.addChild(dl2)
        
        dl3 = SKLabelNode(text: d3)
        dl3.fontName = "Plumpfull"
        dl3.fontColor = .black
        dl3.fontSize = 24
        dl3.horizontalAlignmentMode = .left
        dl3.position = CGPoint(x: 25, y: 120)
        self.addChild(dl3)
        
        talkButton = SKShapeNode(rect: CGRect(x: 80, y: 40, width: 200, height: 50), cornerRadius: 25)
        talkButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        talkButton.strokeColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
        talkButton.lineWidth = 4.0
        talkButton.glowWidth = 0
        
        talkText = SKLabelNode(text: "talk")
        talkText.position = CGPoint(x: 180, y: 50)
        talkText.horizontalAlignmentMode = .center
        talkText.fontName = "Plumpfull"
        talkText.fontSize = 36
        talkText.fontColor = .black
        
        self.addChild(talkButton)
        self.addChild(talkText)
        
        
        typeButton = SKShapeNode(rect: CGRect(x: 320, y: 40, width: 200, height: 50), cornerRadius: 25)
        typeButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        typeButton.strokeColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        typeButton.lineWidth = 4.0
        typeButton.glowWidth = 0
        
        typeText = SKLabelNode(text: "type")
        typeText.position = CGPoint(x: 420, y: 50)
        typeText.horizontalAlignmentMode = .center
        typeText.fontName = "Plumpfull"
        typeText.fontSize = 36
        typeText.fontColor = .black
        
        self.addChild(typeButton)
        self.addChild(typeText)
        
    }
    
    //from xcode
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

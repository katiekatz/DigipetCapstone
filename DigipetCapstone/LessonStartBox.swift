//
//  LessonStartBox.swift
//  Digipet
//
//  Created by Katie Katz on 1/9/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit
import UIKit

public class LessonStartBox: SKShapeNode {
    
    var lessonName: SKLabelNode!
    var line1: SKLabelNode!
    var line2: SKLabelNode!
    var line3: SKLabelNode!
    var line4: SKLabelNode!
    var talkButton : SKShapeNode!
    var talkText : SKLabelNode!
    var typeButton : SKShapeNode!
    var typeText : SKLabelNode!
    
    public init(lN : String, l1: String, l2: String, l3: String, l4: String){
        
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 550))
        self.path = CGPath(roundedRect: rect, cornerWidth: 10, cornerHeight: 10, transform: nil)
        self.strokeColor = .black
        self.glowWidth = 0
        self.lineWidth = 8.0
        
        lessonName = SKLabelNode(text: lN)
        lessonName.fontName = "Plumpfull"
        lessonName.fontColor = .black
        lessonName.fontSize = 78
        lessonName.horizontalAlignmentMode = .center
        lessonName.position = CGPoint(x: 300, y: 315)
        self.addChild(lessonName)
        
        line1 = SKLabelNode(text: l1)
        line1.fontName = "Plumpfull"
        line1.fontColor = .black
        line1.fontSize = 30
        line1.horizontalAlignmentMode = .center
        
        line2 = SKLabelNode(text: l2)
        line2.fontName = "Plumpfull"
        line2.fontColor = .black
        line2.fontSize = 30
        line2.horizontalAlignmentMode = .center
        
        line3 = SKLabelNode(text: l3)
        line3.fontName = "Plumpfull"
        line3.fontColor = .black
        line3.fontSize = 30
        line3.horizontalAlignmentMode = .center
        
        line4 = SKLabelNode(text: l4)
        line4.fontName = "Plumpfull"
        line4.fontColor = .black
        line4.fontSize = 30
        line4.horizontalAlignmentMode = .center
        
        line1.position = CGPoint(x: 300, y: 280)
        self.addChild(line1)
        line2.position = CGPoint(x: 300, y: 240)
        self.addChild(line2)
        line3.position = CGPoint(x: 300, y: 200)
        self.addChild(line3)
        line4.position = CGPoint(x: 300, y: 160)
        self.addChild(line4)
        
        let qText = SKLabelNode(text: "Do you want to talk or type?")
        qText.fontName = "Plumpfull"
        qText.fontColor = .black
        qText.fontSize = 36
        qText.horizontalAlignmentMode = .center
        qText.position = CGPoint(x:300, y:125)
        self.addChild(qText)
        
        talkButton = SKShapeNode(rect: CGRect(x: 80, y: 50, width: 200, height: 50), cornerRadius: 25)
        talkButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        talkButton.strokeColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
        talkButton.lineWidth = 4.0
        talkButton.glowWidth = 0
        
        talkText = SKLabelNode(text: "talk")
        talkText.position = CGPoint(x: 180, y: 60)
        talkText.horizontalAlignmentMode = .center
        talkText.fontName = "Plumpfull"
        talkText.fontSize = 36
        talkText.fontColor = .black
        
        self.addChild(talkButton)
        self.addChild(talkText)
        
        
        typeButton = SKShapeNode(rect: CGRect(x: 320, y: 50, width: 200, height: 50), cornerRadius: 25)
        typeButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        typeButton.strokeColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        typeButton.lineWidth = 4.0
        typeButton.glowWidth = 0
        
        typeText = SKLabelNode(text: "type")
        typeText.position = CGPoint(x: 420, y: 60)
        typeText.horizontalAlignmentMode = .center
        typeText.fontName = "Plumpfull"
        typeText.fontSize = 36
        typeText.fontColor = .black
        
        self.addChild(typeButton)
        self.addChild(typeText)
        
        
    }
    
    //xcode told me to do this
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

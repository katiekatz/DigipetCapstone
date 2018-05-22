//
//  LessonOne.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 11/17/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonOne: SKScene {
    var done: Bool!
    var Pet1: SKSpriteNode!
    var Pet2: SKSpriteNode!
    var sBubble1: SKSpriteNode!
    var sBubble2: SKSpriteNode!
    var pet1Text: SKLabelNode!
    var pet2Text: SKLabelNode!
    var pet2Text2: SKLabelNode!
    var wallNight: SKSpriteNode!
    var nightBG: SKSpriteNode!
    var pointer: SKSpriteNode!
    
    var headerText: SKLabelNode!
    
    var array: [() -> ()] = []
    var correctAnswers: [[String]] = [[]]
    var counter: Int = 0
    
    var lang: Int = 0
    
    var rotateAction: SKAction!
    var pointAction: SKAction!
    var walkInAction2: SKAction!
    var walkIn2: SKAction!
    var walkOut: SKAction!
    
    var prompts: [[String]] = [["你好", "你好吗？", "欢迎","早上好","我很好，你呢？","下午好","你会说中文吗？","请问，怎么说","谢谢","再见","晚上好", "晚安"],["Hola", "¿Cómo estás？", "¡Bienvenido!","Buenos días","Bien, ¿y tú?","Buenas tardes","¿Hablas español?","Por favor, como se dice","¡Gracias!","¡Adios!","Buenas noches", "Buenas noches"],["Bonjour", "Ça va?","Bienvenue!","Salut!","Ça va bien, et toi?","Bonsoir!","Parlez-vous français?","S’il vous plaît, comment dit-on","Merci!","Au revoir!","Bonne nuit!", "Bonne nuit!"]]
    
    override func didMove(to view: SKView) {
        if let language = UserDefaults.standard.string(forKey: "language") {
            switch language {
            case "zh_Hans":
                lang = 0
                break
            case "fr_FR":
                lang = 1
                break
            case "es_ES":
                lang = 2
                break
            default:
                lang = 0
                
            }
        } else {
            lang = 0
        }
        done = false
        rotateAction = SKAction.sequence([SKAction.rotate(byAngle: 0.2, duration: 0.5), SKAction.rotate(byAngle: -0.2, duration: 0.5)])
        pointAction = SKAction.repeat((SKAction.sequence([SKAction.moveBy(x: -5, y: 0, duration: 0.5), SKAction.moveBy(x: 5, y: 0, duration: 0.5)])), count: 10)
        walkInAction2 = SKAction.move(to: CGPoint(x: self.frame.size.width * -0.25, y: self.frame.size.height * -0.2), duration: 4)
        walkIn2 = SKAction.group([walkInAction2, SKAction.repeat(self.rotateAction, count: 4)])
        walkOut = SKAction.move(to: CGPoint(x: self.frame.size.width * -1, y: self.frame.size.height * -0.4), duration: 2.4)
        
        wallNight = SKSpriteNode(imageNamed: "wallnight")
        wallNight.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        wallNight.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        wallNight.zPosition = 0
        wallNight.position = CGPoint(x: 0, y: 0)
        addChild(wallNight)
        
        nightBG = SKSpriteNode(imageNamed: "nightbackground")
        nightBG.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nightBG.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        nightBG.zPosition = -1
        nightBG.position = CGPoint(x: 0, y: 0)
        addChild(nightBG)
        
        sBubble1 = SKSpriteNode(imageNamed: "speechbubble")
        sBubble1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sBubble1.size = CGSize(width: self.frame.size.width * 0.75, height: self.frame.size.height * 0.25)
        sBubble1.zPosition = 1
        sBubble1.position = CGPoint(x: self.frame.size.width * 0.03, y: self.frame.size.height * 0.18)
        addChild(sBubble1)
        sBubble1.isHidden = true
        
        sBubble2 = SKSpriteNode(imageNamed: "speechbubble")
        sBubble2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sBubble2.size = CGSize(width: self.frame.size.width * 0.5, height: self.frame.size.height * 0.16)
        sBubble2.zPosition = 1
        sBubble2.position = CGPoint(x: self.frame.size.width * -0.25, y: self.frame.size.height * 0.03)
        addChild(sBubble2)
        sBubble2.isHidden = true
        
        pet1Text = SKLabelNode()
        pet1Text.zPosition = 2
        pet1Text.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * 0.1))
        pet1Text.fontColor = UIColor.black
        pet1Text.fontName = "Plumpfull"
        pet1Text.fontSize = 30
        addChild(pet1Text)
        pet1Text.isHidden = true
        
        pet2Text = SKLabelNode()
        pet2Text.zPosition = 2
        pet2Text.position = CGPoint(x: sBubble2.position.x, y: sBubble2.position.y + (sBubble2.position.y * 0.75))
        pet2Text.fontColor = UIColor.black
        pet2Text.fontName = "Plumpfull"
        pet2Text.fontSize = 15
        addChild(pet2Text)
        pet2Text.isHidden = true
        
        pet2Text2 = SKLabelNode()
        pet2Text2.zPosition = 2
        pet2Text2.position = CGPoint(x: sBubble2.position.x, y: sBubble2.position.y - (sBubble2.position.y * 0.1))
        pet2Text2.fontColor = UIColor.black
        pet2Text2.fontName = "Plumpfull"
        pet2Text2.fontSize = 15
        addChild(pet2Text2)
        pet2Text2.isHidden = true
        
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: self.frame.size.width * 0.5, height: self.frame.size.height * 0.39)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        Pet2 = SKSpriteNode(imageNamed: "petplain")
        Pet2.size = CGSize(width: self.frame.size.width * 0.4, height: self.frame.size.height * 0.3)
        Pet2.color = UIColor.red
        Pet2.colorBlendFactor = 0.5
        Pet2.zPosition = 1
        Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet2)
        
//        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
//        talkButton.isHidden = true
        
        headerText = SKLabelNode()
        headerText.zPosition = 1.0
        // .16 .44
        headerText.position = CGPoint(x: 0, y: self.frame.size.height * 0.35)
        headerText.fontName = "Plumpfull"
        headerText.fontSize = 30
        headerText.fontColor = UIColor.white
        headerText.text = ""
        addChild(headerText)
        //headerText.isHidden = true
        
        pointer = SKSpriteNode(imageNamed: "arrowicon")
        pointer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pointer.size = CGSize(width: self.frame.size.width * 0.15, height: self.frame.size.height * 0.056)
        pointer.xScale = -1
        pointer.zPosition = 1.0
        pointer.position = CGPoint(x: self.frame.size.width * -0.25, y: self.frame.size.height * -0.39)
        pointer.color = UIColor.white
        pointer.colorBlendFactor = 1.0
        addChild(pointer)
        pointer.isHidden = true
        
        array = [entranceAnimation, firstQuestion, sunrise, askQuestion, andYou, pet3, doYouSpeak, howDoYouSay, howDoYouSay2, thank, goodbye]
        correctAnswers = [["你好","我很好","早上好","你好吗","我马马虎虎","下午好","我会说中文","对不起","没关系","不客气","再见","晚安"],["bonjour","ça va bien","salut","ça va","ça va","bonsoir","je parle français","désolé","ça va","de rien","au revoir","bonne nuit"],["hola","muy bien","buenos días","bien","buenas tardes","hablo español","lo siento","está bien","de nada","adios","buenas noches"]]
        
        runLesson()
    }
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return (NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String)
    }
    
    func runLesson() {
        entranceAnimation()
    }
    
    func entranceAnimation() {
        let walkInAction: SKAction = SKAction.move(to: CGPoint(x: self.frame.size.width * 0.21, y: self.frame.size.height * -0.165), duration: 4)
        let walkIn: SKAction = SKAction.group([walkInAction, SKAction.repeat(rotateAction, count: 4)])
        
        Pet1.run(walkIn)
        
        Timer.scheduledTimer(withTimeInterval: 4.5, repeats: false) {
            timer in
            
            self.sBubble1.isHidden = false
            self.pet1Text.text = self.prompts[self.lang][0]
            self.pet1Text.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {
                timer in
                self.pointer.isHidden = false
                self.pointer.run(self.pointAction)
            }
        }
        
    }
    
    func firstQuestion() {
        //talkButton.isHidden = true
        self.pet1Text.text = prompts[lang][1]
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                self.headerText.text = "👍"
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
            
                }
    }
    
    func sunrise() {
        //talkButton.isHidden = true
        self.pet1Text.text = prompts[lang][2]
        self.headerText.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            self.pet1Text.text = ""
            
            self.Pet2.run(self.walkIn2)
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {
                timer in
                let dayBackground = SKSpriteNode(imageNamed: "daybackground")
                dayBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                dayBackground.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
                dayBackground.zPosition = -0.5
                dayBackground.position = CGPoint(x: 0, y: 0)
                dayBackground.alpha = 0
                self.addChild(dayBackground)
                
                let dayWall = SKSpriteNode(imageNamed: "wallday")
                dayWall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                dayWall.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
                dayWall.zPosition = 0.5
                dayWall.position = CGPoint(x: 0, y: 0)
                dayWall.alpha = 0
                self.addChild(dayWall)
                
                dayWall.run(SKAction(named: "Sunrise")!)
                dayBackground.run(SKAction(named: "Sunrise")!)
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                    timer in
                    
                    self.pet2Text.text = self.prompts[self.lang][3]
                    self.pet2Text.isHidden = false
                    self.sBubble2.isHidden = false
                    Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                        self.pointer.isHidden = false
                        self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
                }
                
            }

        }
    }
    
    func askQuestion() {
        //talkButton.isHidden = true
        headerText.text = "Ask it a question!"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
    }
    
    func andYou() {
        //talkButton.isHidden = true
        pet2Text.text = prompts[self.lang][4]
        pet2Text2.text = prompts[self.lang][5]
        pet2Text2.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) {
            timer in
            self.headerText.text = "😐"
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                self.pointer.isHidden = false
                self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
        }
    }
    
    func pet3() {
        //talkButton.isHidden = true
        Pet2.run(walkOut)
        pet2Text.text = ""
        pet2Text2.text = ""
        pet2Text.isHidden = true
        pet2Text2.isHidden = true
        sBubble2.isHidden = true
        headerText.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) {
            timer in
            
            self.Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
            self.Pet2.color = UIColor.blue
            self.Pet2.run(self.walkIn2)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.pet2Text.isHidden = false
                self.pet2Text2.isHidden = false
                self.sBubble2.isHidden = false
                self.pet2Text.text = self.prompts[self.lang][6]
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    self.pointer.isHidden = false
                    self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
            }
            
        }
        
    }
    
    func doYouSpeak() {
        //talkButton.isHidden = true
        pet2Text.text = prompts[self.lang][7]
        pet2Text2.text = prompts[self.lang][8]
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
    }
    
    func howDoYouSay() {
        //talkButton.isHidden = true
        pet2Text.text = prompts[self.lang][9]
        pet2Text2.text =  "\"sorry\"?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
    }
    
    func howDoYouSay2() {
        //talkButton.isHidden = true
        pet2Text.text = prompts[self.lang][9]
        pet2Text2.text = "\"It's okay\"?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }

    }
    
    func thank() {
        //talkButton.isHidden = true
        pet2Text.text = prompts[self.lang][10]
        pet2Text2.text = ""
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
                    //self.talkButton.isHidden = false
                }
    }
    
    func goodbye() {
        //talkButton.isHidden = true
        pet1Text.text = prompts[self.lang][11]
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            self.pointer.isHidden = false
            self.pointer.run(self.pointAction)
            self.done = true
                    //self.talkButton.isHidden = false
                }
    }
    
//    @IBAction func doSomething(sender: SKSpriteNode!) {
//        let propertyToCheck = sender.
//        switch propertyToCheck {
//        case: "caseOne"
//        // do something
//        case: "caseTwo"
//        // do something else
//        default: break
//        }
//    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func checkAnswer(answer: String) -> Bool {
        if (answer.lowercased() == correctAnswers[lang][counter].lowercased()) {
            nextPrompt()
            return true
        }
        
        return false
    }
    
    func isDone() -> Bool {
        return self.done
    }
    
    func nextPrompt() {
        counter += 1
        if counter < array.count {
            self.array[counter]()
            self.pointer.isHidden = true
        }
    }
    
    func die() {
        wallNight.color = UIColor.red
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//
//        let touchLocation = touch.location(in: self)
//
//        if talkButton.contains(touchLocation) {
//            if counter < array.count {
//                self.array[counter]()
//                counter += 1
//            }
//        }
//
//    }
    
}


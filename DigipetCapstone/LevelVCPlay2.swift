//
//  LevelVCPlay2.swift
//  DigipetCapstone
//
//  Created by Katie Katz on 5/22/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class LevelVCPlay2 : UIViewController {
    
    var l1Games = [Minigame]()
    var l2Games = [Minigame]()
    var l3Games = [Minigame]()
    var l4Games = [Minigame]()
    var l5Games = [Minigame]()
    var l6Games = [Minigame]()
    
    let minigame1 = Minigame(name: "Basics I", prevImg: "china", fileDest: "L1GameOne", infoVH: "hello, goodbye, yes, no, maybe, okay, please, thank you, you're welcome, good morning...", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa ab abaw erfwarf awefaw svawraf aewjn", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame2 = Minigame(name: "Basics II", prevImg: "china", fileDest: "L1GameTwo", infoVH: "apple, man, woman, dog, cat, picture, people, draw, sing...", infoDir: "Match cards and say what's on them to collect them.", startDesc: "Learn basic nouns, verbs, and numbers.")!
    let minigame3 = Minigame(name: "testing", prevImg: "china", fileDest: "ha2", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame4 = Minigame(name: "bwahaha", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame5 = Minigame(name: "will this work?", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame6 = Minigame(name: "abcxyz123", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame7 = Minigame(name: "Nikki Blonsky", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    
    let colorDef = UIColor(red: 127/255.0, green: 70/255.0, blue: 221/255.0, alpha: 1)
    let color1 = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
    let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    let color3 = UIColor(red: 251/255.0, green: 174/255.0, blue: 23/255.0, alpha: 1)
    let color4 = UIColor(red: 237/255.0, green: 30/255.0, blue: 121/255.0, alpha: 1)
    let color5 = UIColor(red: 6/255.0, green: 232/255.0, blue: 1, alpha: 1)
    let color6 = UIColor(red: 252/255.0, green: 238/255.0, blue: 34/255.0, alpha: 1)
    
    var text : String = "0"
    var showInfo : String = "nil"
    var tableViewController : GameTableViewController2?
    var minigameFocus : Minigame?
    
    @IBOutlet weak var levelNumber: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoMinigameName: UILabel!
    @IBOutlet weak var infoVH: UILabel!
    @IBOutlet weak var infoDir: UILabel!
    @IBOutlet weak var infoStartButton: GameButton!
    @IBOutlet weak var infoBackButton: GameButton!
    
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

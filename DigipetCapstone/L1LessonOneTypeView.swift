//
//  NewL1LessonOne.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 3/13/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class L1LessonOneTypeView : UIViewController {
    
    @IBOutlet weak var myView: SKView!
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var myScene: L1LessonOne = L1LessonOne()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myView.presentScene(myScene)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.searchBar.endEditing(true)
    }
    
    @IBAction func answerDone(_ sender: UITextField) {
        //myScene.checkAnswer(answer: textField.text!)
        (myView.scene as! L1LessonOne).checkAnswer(answer: textField.text!)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        textField.becomeFirstResponder()
        //delegate?.die()
    }
    
    func revealButton() {
        talkButton.isHidden = false
    }
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

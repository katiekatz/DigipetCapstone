//
//  File.swift
//  Digipet
//
//  Created by Timothy Obiso on 2/5/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class MainScreen : UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZCardSlideAnimationController()
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCardSlideAnimationController()
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func learnButtonTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "learnScreen")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
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

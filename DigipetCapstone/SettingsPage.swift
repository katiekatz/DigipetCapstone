//
//  SettingsPage.swift
//  DigipetCapstone
//
//  Created by Timothy Obiso on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class SettingsPage : UIViewController {
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var frenchButton: UIButton!
    @IBOutlet weak var currentLanguage: UILabel!
    let languages = ["中文", "Français","Español"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "language") == "zh_Hans" {
            currentLanguage.text = "中文"
        } else if UserDefaults.standard.string(forKey: "language") == "es_ES" {
            currentLanguage.text = "Español"
        } else {
            currentLanguage.text = "Français"
        }
    }
    @IBAction func pressChinese(_ sender: Any) {
        UserDefaults.standard.set("zh_Hans", forKey: "language")
        currentLanguage.text = "中文"
    }
    
    @IBAction func pressSpanish(_ sender: Any) {
        UserDefaults.standard.set("es_ES", forKey: "language")
        currentLanguage.text = "Español"
        
    }
    @IBAction func pressFrench(_ sender: Any) {
        UserDefaults.standard.set("fr_FR", forKey: "language")
        currentLanguage.text = "Français"
    }
    // stan loona
    
    
}

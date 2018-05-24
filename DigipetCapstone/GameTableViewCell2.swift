//
//  GameTableViewCell2.swift
//  DigipetCapstone
//
//  Created by Katie Katz on 5/23/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class GameButton2 : UIButton {
    var minigame : Minigame?
}

class GameTableViewCell2 : UITableViewCell {
    
    @IBOutlet weak var minigameName: UILabel!
    @IBOutlet weak var prevImage: UIImageView!
    @IBOutlet weak var startButton: GameButton2!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        startButton.layer.cornerRadius = 14
        startButton.layer.masksToBounds = true
        startButton.layer.borderWidth = 2
        startButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
    }
}

//
//  GameTableViewCell.swift
//  DigipetCapstone
//
//  Created by Emma Ingallinera on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class GameButton : UIButton {
    var minigame : Minigame?
}

class GameTableViewCell : UITableViewCell {
    @IBOutlet weak var minigameName: UILabel!
    @IBOutlet weak var prevImg: UIImageView!
    @IBOutlet weak var startButton: GameButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        print(self)
        print(self.startButton == nil)
        
        if startButton != nil {
            startButton.layer.cornerRadius = 14
            startButton.layer.masksToBounds = true
            startButton.layer.borderWidth = 2
            startButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        }
        
        
    }
    
    
    
}


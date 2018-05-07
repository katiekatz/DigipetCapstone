//
//  LessonTableViewCell.swift
//  Digipet
//
//  Created by Katie Katz on 3/6/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class LessonButton : UIButton {
    var lesson : Lesson?
}

class LessonTableViewCell : UITableViewCell {
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var startButton: LessonButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        startButton.layer.cornerRadius = 14
        startButton.layer.masksToBounds = true
        startButton.layer.borderWidth = 2
        startButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        
    }


    
}

//
//  Minigame.swift
//  DigipetCapstone
//
//  Created by Emma Ingallinera on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class Minigame {
    
    var name : String
    var prevImg : String
    var fileDest : String
    var infoVH : String
    var infoDir : String
    var startDesc : String
    
    init?(name: String, prevImg : String, fileDest : String, infoVH : String, infoDir : String, startDesc : String){
        
        guard !name.isEmpty else {
            return nil
        }
        guard !prevImg.isEmpty else {
            return nil
        }
        guard !fileDest.isEmpty else {
            return nil
        }
        guard !infoVH.isEmpty else {
            return nil
        }
        guard !infoDir.isEmpty else {
            return nil
        }
        guard !startDesc.isEmpty else {
            return nil
        }
        
        self.name = name
        self.prevImg = prevImg
        self.fileDest = fileDest
        self.infoVH = infoVH
        self.infoDir = infoDir
        self.startDesc = startDesc
    }
    
}

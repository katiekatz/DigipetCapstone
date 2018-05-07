//
//  Lesson.swift
//  Digipet
//
//  Created by Katie Katz on 3/6/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class Lesson {
    
    var name : String
    var petImg : String
    var fileDest : String
    var infoVH : String
    var infoGD : String
    var startDesc : String
    
    init?(name: String, petImg : String, fileDest : String, infoVH : String, infoGD : String, startDesc : String){
        
        guard !name.isEmpty else {
            return nil
        }
        guard !petImg.isEmpty else {
            return nil
        }
        guard !fileDest.isEmpty else {
            return nil
        }
        guard !infoVH.isEmpty else {
            return nil
        }
        guard !infoGD.isEmpty else {
            return nil
        }
        guard !startDesc.isEmpty else {
            return nil
        }
        
        self.name = name
        self.petImg = petImg
        self.fileDest = fileDest
        self.infoVH = infoVH
        self.infoGD = infoGD
        self.startDesc = startDesc
    }
    
}

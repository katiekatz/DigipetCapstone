//
//  GameTableViewController2.swift
//  DigipetCapstone
//
//  Created by Katie Katz on 5/23/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class GameTableViewController2 : UITableViewController {
    
    var gameNumber : String = "0"
    var minigameList = [Minigame]()
    var color : CGColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tableView.alwaysBounceVertical = false
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minigameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "GameTableViewCell2"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GameTableViewCell2 else {
            fatalError("The dequeued cell is not an instance of GameTableViewCell2")
        }
        
        let minigame = minigameList[indexPath.row]
        
        cell.minigameName.text = minigame.name
        cell.prevImage.image = UIImage(named: minigame.prevImg)
        cell.startButton.minigame = minigame
        cell.startButton.layer.borderColor = color
        return cell
        
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        
        let parent = self.parent as! LevelVCPlay2
        let ib = sender as! GameButton2
        parent.minigameFocus = ib.minigame
        parent.text = gameNumber
        parent.infoMinigameName.text = ib.minigame?.name
        parent.infoVH.text = ib.minigame?.infoVH
        parent.infoDir.text = ib.minigame?.infoDir
        UIView.animate(withDuration: 0.3){
            print("animating")
            parent.blur.isHidden = false
            parent.infoView.isHidden = false
            parent.blur.alpha = 1
            parent.infoView.alpha = 1
        }
        
    }
    
    
}

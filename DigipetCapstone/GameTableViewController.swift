//
//  GameTableViewController.swift
//  DigipetCapstone
//
//  Created by Emma Ingallinera on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class GameTableViewController : UITableViewController {
    
    var gameNumber : String = "0"
    var minigameList = [Minigame]()
    var color : CGColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView()
        
        tableView.alwaysBounceVertical = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minigameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "GameTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GameTableViewCell  else {
            fatalError("The dequeued cell is not an instance of GameTableViewCell.")
        }
        
        print("----------")
        print(cell)
        print("----------")
        
        
        // Fetches the appropriate meal for the data source layout.
        let minigame = minigameList[indexPath.row]
        
        cell.minigameName.text = minigame.name
        cell.prevImg.image = UIImage(named: minigame.prevImg)
        cell.startButton.minigame = minigame
        cell.startButton.layer.borderColor = color
        return cell
        
        
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        
        print("infoButtonPressed")
        let parent = self.parent as! LevelVCPlay
        let ib = sender as! GameButton
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
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let vc = segue.destination as? LevelVC {
    //            let ib = sender as! GameButton
    //            vc.minigameFocus = ib.minigame
    //            vc.text = minigameNumber
    //            vc.showInfo = "yes"
    //        }
    //    }
    
    
}


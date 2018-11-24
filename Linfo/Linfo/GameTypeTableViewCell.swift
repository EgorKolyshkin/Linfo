//
//  GameTypeTableViewCell.swift
//  Linfo
//
//  Created by Егор on 24/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class GameTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var progress: UILabel!
    
    func setFields(gameType: String, rating: String, progress: String)  {
        self.gameType.text = gameType
        self.rating.text = rating
        self.progress.text = progress
    }

}

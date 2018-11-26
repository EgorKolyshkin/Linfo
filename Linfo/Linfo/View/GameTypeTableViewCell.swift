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
        
    public var viewModel: GameTypeViewModelCell? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.gameType.text = viewModel.type
            self.rating.text = viewModel.rating
            self.progress.text = viewModel.progress
        }
    }
    
}

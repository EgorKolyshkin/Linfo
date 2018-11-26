//
//  ViewModelCell.swift
//  Linfo
//
//  Created by Егор on 24/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

class GameTypeViewModelCell {
    
    private let gameResults: GameResults
    private let gameType: String
    
    init(gameType: String, gameResults: GameResults) {
        self.gameResults = gameResults
        self.gameType = gameType
    }
    
    var type: String {
        return gameType
    }
    
    var rating: String {
        return String(gameResults.rating)
    }
    
    var progress: String {
        return String(gameResults.prog)
    }
    
    
}

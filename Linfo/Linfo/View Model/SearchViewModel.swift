//
//  SearchViewModel.swift
//  Linfo
//
//  Created by Егор on 25/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    private var networking = Networking()
    
    private var user: User?
    
    public func getUserStatistic(userName: String, completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: LichessApi.user(user: userName), type: User.self)
        { [weak self] response in
            self?.user = response
            completion?()
        }
    }
    
    public func cellViewModel(for index: Int) -> GameTypeViewModelCell? {
        guard let user = user else { return nil }
        
        var cellViewModel: GameTypeViewModelCell?
        switch index {
        case 0:
            cellViewModel = GameTypeViewModelCell(gameType: "Blitz", gameResults: user.perfs.blitz)
        case 1:
            cellViewModel = GameTypeViewModelCell(gameType: "Bullet", gameResults: user.perfs.bullet)
        case 2:
            cellViewModel = GameTypeViewModelCell(gameType: "Classical", gameResults: user.perfs.classical)
        case 3:
            cellViewModel = GameTypeViewModelCell(gameType: "Correspondence", gameResults: user.perfs.correspondence)
        case 4:
            cellViewModel = GameTypeViewModelCell(gameType: "Puzzle", gameResults: user.perfs.puzzle)
        case 5:
            cellViewModel = GameTypeViewModelCell(gameType: "Rapid", gameResults: user.perfs.rapid)
        default:
            break
        }
        return cellViewModel
    }
    
}

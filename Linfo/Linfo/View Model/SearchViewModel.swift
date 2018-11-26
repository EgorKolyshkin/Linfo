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
    
    public func getMostPopularRepos(userName: String,
                                    completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: LichessApi.user(user: userName),
                                      type: User.self) { [weak self] (response) in
                                        self?.user = response
                                        completion?()
        }
    }
    
    public func cellViewModel(for index: Int) -> GameTypeViewModelCell? {
        guard let user = user else { return nil }
        let gameTypeViewModelCell = GameTypeViewModelCell(gameType: gameType, gameResults: gameResults)
        return gameTypeViewModelCell
    }
    
}

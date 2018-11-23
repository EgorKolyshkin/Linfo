//
//  Perfs.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct Perfs: Decodable {
    let blitz: GameResults
    let bullet: GameResults
    let correspondence: GameResults
    let puzzle: GameResults
    let classical: GameResults
    let rapid: GameResults
}

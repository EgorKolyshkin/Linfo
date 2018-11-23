//
//  User.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let userName: String
    let online: Bool
    let perfs: Perfs
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userName = "username"
        case online
        case perfs
    }
}

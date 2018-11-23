//
//  LichessAPI.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

enum LichessApi {
    case user(user: String)
}


extension LichessApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://lichess.org/api/")!
    }
    
    var path: String {
        switch self {
        case .user(let userName):
            return "user/\(userName)"
        }
    }
}

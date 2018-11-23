//
//  EnpointProtocol.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

protocol EndpointType {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
}

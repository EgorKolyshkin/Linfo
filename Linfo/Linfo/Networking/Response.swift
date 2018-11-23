//
//  File.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Decodable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        let response = try? jsonDecoder.decode(T.self, from: data)
        return response
    }
}

//
//  Response.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

protocol FetchLocalJsonProtocol {
    func instanceFromFile(_ fileName: String) -> Data
}


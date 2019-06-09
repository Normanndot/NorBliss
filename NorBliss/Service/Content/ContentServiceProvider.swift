//
//  ContentServiceProvider.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

class ContentServiceProvider: ServiceProvider, ContentService {
    
    func contentList(api: Api, _ completion: @escaping ([Card]?) -> Void) {

        _ = getWithURL(api) { (data, error) in
            if let data = data as? Data {
                let response = Response(data: data)
                
                guard let decoded = response.decode(DataModel.self) else {
                    return
                }
                
                completion(decoded.data?.cards)
            } else {
                self.isTest = true
            }
        }
    }
}

class ContentServiceMockProvider: ContentService, FetchLocalJsonProtocol {
    
    func instanceFromFile(_ fileName: String) -> Data {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        if let _ = path {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
                return data
            } else {
                return Data()
            }
        } else {
            return Data()
        }
    }
    
    
    func contentList(api: Api, _ completion: @escaping ([Card]?) -> Void) {
        let data = instanceFromFile("interview")
        
        let response = Response(data: data)
        
        guard let decoded = response.decode(DataModel.self) else {
            return
        }
        
        completion(decoded.data?.cards)
    }
}

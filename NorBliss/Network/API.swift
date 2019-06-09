//
//  API.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}

enum Api {
    case list
}

extension Api: EndpointType {
    var baseURL: URL {
        return URL(string: "https://shuffle-stub-627da.firebaseapp.com")!
    }
    
    var path: String {
        switch self {
        case .list:
            return "/interview.json"
        }
    }
}

enum MockApi {
    case list
}

extension MockApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://mockurl")!
    }
    
    var path: String {
        switch self {
        case .list:
            return "/interview.json"
        }
    }
}

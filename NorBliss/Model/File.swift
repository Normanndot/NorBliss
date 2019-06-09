//
//  File.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    let data: MoviesData?
     private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct MoviesData: Codable {
    let cards: [Card]?
    
    private enum CodingKeys: String, CodingKey {
        case cards = "cards"
    }
}

struct Card: Codable {
    let card_id : String
    var priority: Double
    let content: Movie
    
    private enum CodingKeys: String, CodingKey {
        case card_id = "card_id", priority = "priority", content = "content"
    }
}

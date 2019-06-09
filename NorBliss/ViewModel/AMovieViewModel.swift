//
//  AMovieModel.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol AMovieModelProtocol {
    var card: Card { get }
}

class AMovieViewModel: NSObject, AMovieModelProtocol {
    var card: Card
    
    init(with aMovie: Card) {
        self.card = aMovie
    }
}

//
//  ViewModel.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation
import UIKit

protocol Fetchable {
    func fetchMoviesList(completion: @escaping () -> ())
}

protocol MoviesProtocol {
    func titleForIndexPath(_ indexPath: IndexPath) -> String
    func descriptionForIndexPath(_ indexPath: IndexPath) -> String
    func imageForIndexPath(_ indexPath: IndexPath, imageView: UIImageView)
}

protocol SortProtocol {
    func sortedMovieList() -> [Card]
}

protocol SearchProtocol {
    func searchMovies(_ name: String) -> [Card]
}

class ViewModel: NSObject, Fetchable {
    var movies: [Card] = []
    
    func fetchMoviesList(completion: @escaping () -> ()) {
        let api = Api.list
        
        ServiceManager.contentService.contentList(api: api) { (list) in
            self.movies = list ?? []
            completion()
        }
    }
}

extension ViewModel: MoviesProtocol {
    
    func titleForIndexPath(_ indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].content.title
    }
    
    func descriptionForIndexPath(_ indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].content.director
    }
    
    func imageForIndexPath(_ indexPath: IndexPath, imageView: UIImageView) {
        if let url = URL(string: self.movies[indexPath.row].content.poster) {
            LazyLoader.sharedInstance.loadImage(imageView, url: url)
        }
    }
}

extension ViewModel: SortProtocol {
    func sortedMovieList() -> [Card] {
        
        let sortedCard = self.movies.sorted { (cardA, cardB) -> Bool in
            return cardA.priority > cardB.priority
        }
        
        return sortedCard
    }
}

extension ViewModel: SearchProtocol {
    
    func searchMovies(_ name: String) -> [Card] {
        let filteredCard = self.movies.filter({$0.content.title.contains(name)})
        
        return filteredCard
    }
    
}

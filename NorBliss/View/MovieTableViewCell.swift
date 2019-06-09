//
//  MovieTableViewCell.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var aMovieModel: AMovieViewModel? {
        didSet {
            self.setUpUI()
        }
    }
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var directorName: UILabel!
    
    private func setUpUI() {
        if let aImageView = self.imagePoster, let url = URL(string: aMovieModel?.card.content.poster ?? String()) {
            LazyLoader.sharedInstance.loadImage(aImageView, url: url)
        }
        
        self.title.text = aMovieModel?.card.content.title
        self.directorName.text = aMovieModel?.card.content.director
    }
}

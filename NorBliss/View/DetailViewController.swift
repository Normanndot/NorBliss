//
//  DetailViewController.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var cardDetails: AMovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(cardDetails?.card.content.title)
        print(cardDetails?.card.content.director)
    }
}

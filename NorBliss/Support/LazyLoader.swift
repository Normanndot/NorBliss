//
//  LazyLoader.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol ImageLoader {
    func loadImage(_ imageView: UIImageView, url : URL)
}

class LazyLoader: ImageLoader {
    
    static let sharedInstance = LazyLoader()
    
    func loadImage(_ imageView: UIImageView, url: URL) {
        imageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
    }
}

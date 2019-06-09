//
//  ContentService.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol ContentService {
    func contentList(api: Api, _ completion: @escaping (_ content: [Card]?) -> Void)
}

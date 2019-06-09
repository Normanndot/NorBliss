//
//  Task.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol Task {
    func performNetworkTask(endpoint: Api, completion: ((_ response: Any?, _ error: Error?) -> Void)?)
    func cancel()
}

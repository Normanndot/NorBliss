//
//  ServiceManager.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

class ServiceManager {
    static let contentService: ContentService = ContentServiceProvider()
}

class MockServiceManager {
    static let contentService: ContentService = ContentServiceMockProvider()
}

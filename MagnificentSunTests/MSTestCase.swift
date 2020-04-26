//
//  MSTestCase.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 26.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
import XCTest

class MSTestCase: XCTestCase {
    var utils = TestUtils(imagesDir: "MSTestCase")
    
    override func setUp() {
        utils.clearFiles()
    }
    
    override func tearDown() {
        utils.clearFiles()
    }
}

//
//  FilesProviderTests.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
import SwiftDate
@testable import MagnificentSun

class FilesProviderTests: MSTestCase {
    private let provider = FilesProvider()
    
    func testStoringImage() {
        var sunImage = utils.createTestSunImage()
        
        XCTAssertFalse(utils.isDirectoryExist(for: sunImage))

        sunImage.imageData = utils.loadTestImageData(named: "f_094_335_193")
        
        _ = try! provider.store(sunImage).toBlocking(timeout: 1).first()
        
        XCTAssertTrue(utils.isDirectoryExist(for: sunImage))
        
        XCTAssertTrue(utils.isFileExist(for: sunImage))
    }
    
    func testRequestingImage() {
         var sunImage = utils.createTestSunImage()
               
        XCTAssertFalse(utils.isDirectoryExist(for: sunImage))

        let data = utils.loadTestImageData(named: "f_094_335_193")
        sunImage.imageData = data
        
        _ = try! provider.store(sunImage).toBlocking().first()
        
        XCTAssertTrue(utils.isDirectoryExist(for: sunImage))
        
        let image = try! provider.requestImage(for: sunImage).toBlocking(timeout: 1).first()
        
        XCTAssertEqual(image?.imageData, data)
    }
}

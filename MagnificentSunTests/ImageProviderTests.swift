//
//  ImageProviderTests.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 26.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
import SwiftDate

@testable import MagnificentSun

class ImageProviderTests: MSTestCase {
    private let provider = ImageProvider()
    
    func testRequestingNotExistingFile() {
        let sunImage = utils.createTestSunImage(lentgh: .l_094_335_193, type: .s_256, date: Date(year: 2020, month: 04, day: 24))
        
        XCTAssertFalse(utils.isFileExist(for: sunImage))
        
        let requestedImage = try! provider.requestImage(for: sunImage.wave, type: sunImage.type, date: sunImage.date).toBlocking(timeout: 60).first()
        
        XCTAssertTrue(utils.isFileExist(for: sunImage))
        
        let localImageData = utils.loadTestImageData(named: "t_094_335_193")
        
        XCTAssertEqual(requestedImage!.imageData, localImageData)
    }
    
    func testRequestingExistingFile() {
        var sunImage = utils.createTestSunImage(lentgh: .l_094_335_193, type: .s_256, date: Date(year: 2020, month: 04, day: 24))
        
        XCTAssertFalse(utils.isFileExist(for: sunImage))
        let localImageData = utils.loadTestImageData(named: "t_094_335_193")
        sunImage.imageData = localImageData
        _ = try! FilesProvider().store(sunImage).toBlocking().first()
        
        XCTAssertTrue(utils.isFileExist(for: sunImage))
        
        let requestedImage = try! provider.requestImage(for: sunImage.wave, type: sunImage.type, date: sunImage.date).toBlocking(timeout: 60).first()
        
        XCTAssertTrue(utils.isFileExist(for: sunImage))
        
        XCTAssertEqual(requestedImage!.imageData, localImageData)
    }
}

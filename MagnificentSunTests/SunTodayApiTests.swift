//
//  SunTodayApiTests.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
import RxBlocking
@testable import MagnificentSun

class SunTodayApiTests: MSTestCase {
    private let api = SunTodayApi()
    
    func testSingleImageRequest() {
        let sunImage = utils.createTestSunImage(lentgh: .l_094_335_193, type: .s_256, date: Date(year: 2020, month: 04, day: 24))
        let result = try! api.loadImage(into: sunImage)
            .toBlocking(timeout: 10)
            .first()
        
        XCTAssertNotNil(result?.imageData)

        let data = utils.loadTestImageData(named: "t_094_335_193")
        
        XCTAssertEqual(data, result?.imageData)
    }
    

}

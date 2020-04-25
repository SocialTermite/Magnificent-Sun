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

class SunTodayApiTests: XCTestCase {
    private let api = SunTodayApi()
    
    func testSingleImageRequest() {
        let date = Date(year: 2020, month: 04, day: 24, hour: 0, minute: 0)
        let sunImage = SunImage(uuid: UUID(), type: .s_256, wave: .l_094_335_193, date: date, imageData: nil)
        let result = try! api.loadImage(into: sunImage)
            .toBlocking(timeout: 10)
            .first()
        
        XCTAssertNotNil(result?.imageData)

        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: "t_094_335_193", ofType: "jpg")
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        
        XCTAssertEqual(data, result?.imageData)
    }
    

}

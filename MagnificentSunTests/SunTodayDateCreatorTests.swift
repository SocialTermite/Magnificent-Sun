//
//  SunTodayDateCreatorTests.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
import SwiftDate
@testable import MagnificentSun

class SunTodayDateCreatorTests: XCTestCase {
    let testPairs: [Date: String] = [
        Date(year: 2019, month: 4, day: 16): "2019/04/16/",
        Date(year: 2020, month: 10, day: 1): "2020/10/01/",
        Date(year: 2019, month: 12, day: 31): "2019/12/31/",
        Date(year: 2020, month: 1, day: 1): "2020/01/01/",
    ]
    func testDateURLPathStringCreation() {
        for date in testPairs.keys {
            XCTAssertEqual(SunTodayDateCreator.urlPath(for: date), testPairs[date]!)
        }
        
    }
}


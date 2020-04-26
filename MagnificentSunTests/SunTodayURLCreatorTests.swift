//
//  SunTodayURLCreator.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
import SwiftDate
@testable import MagnificentSun

class SunTodayURLCreatorTests: XCTestCase {
    
    private struct SunURLIn: Hashable {
        let lenght: WaveLenght
        let type: ImageType
        let date: Date
    }
    
    private let testPairs: [SunURLIn: URL] = [
        .init(lenght: .l_304, type: .s_256,
              date: Date(year: 2020, month: 01, day: 03)):
            URL(string: "http://suntoday.lmsal.com/sdomedia/SunInTime/2020/01/03/t0304.jpg")!,
        
        .init(lenght: .l_304_211_171, type: .s_1024, date: Date(year: 2018, month: 12, day: 31)):
            URL(string: "http://suntoday.lmsal.com/sdomedia/SunInTime/2018/12/31/l_304_211_171.jpg")!,
        
        .init(lenght: .l_304_211_171, type: .pfss, date: Date(year: 2020, month: 01, day: 03)):
            URL(string: "http://suntoday.lmsal.com/sdomedia/SunInTime/2020/01/03/f_304_211_171pfss.jpg")!,
        
        .init(lenght: .l_304_211_171, type: .pfssnolines, date: Date(year: 2020, month: 01, day: 03)):
            URL(string: "http://suntoday.lmsal.com/sdomedia/SunInTime/2020/01/03/f_304_211_171pfssnolines.jpg")!,
    ]
    
    
    func testCreatingSunTodayURLWithParameters() {
        for inKey in testPairs.keys {
            XCTAssertEqual(SunTodayURLCreator.create(for: inKey.lenght, type: inKey.type, date: inKey.date), testPairs[inKey]!)
        }
    }
    
}

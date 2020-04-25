//
//  SunTodayNameCreatorTests.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import XCTest
@testable import MagnificentSun

class SunTodayNameCreatorTests: XCTestCase {
    
    struct TestInfo {
        let lenght: WaveLenght
        let type: ImageType
        
        let result: String
    }
    
    
    var checkValues: [TestInfo] = [
        //first tab in SunToday.lmsal.com
        .init(lenght: .l_304, type: .s_256, result: "t0304"),
        .init(lenght: .l_304, type: .s_1024, result: "l0304"),
        .init(lenght: .l_304, type: .s_4096, result: "f0304"),
        .init(lenght: .l_304, type: .pfss, result: "f0304pfss"),
        .init(lenght: .l_304, type: .pfssnolines, result: "f0304pfssnolines"),
        
        .init(lenght: .l_1600, type: .s_256, result: "t1600"),
        .init(lenght: .l_1600, type: .s_1024, result: "l1600"),
        .init(lenght: .l_1600, type: .s_4096, result: "f1600"),
        .init(lenght: .l_1600, type: .pfss, result: "f1600pfss"),
        .init(lenght: .l_1600, type: .pfssnolines, result: "f1600pfssnolines"),
        
        .init(lenght: .l_1700, type: .s_256, result: "t1700"),
        .init(lenght: .l_1700, type: .s_1024, result: "l1700"),
        .init(lenght: .l_1700, type: .s_4096, result: "f1700"),
        .init(lenght: .l_1700, type: .pfss, result: "f1700pfss"),
        .init(lenght: .l_1700, type: .pfssnolines, result: "f1700pfssnolines"),
        
        .init(lenght: .l_304_211_171, type: .s_256, result: "t_304_211_171"),
        .init(lenght: .l_304_211_171, type: .s_1024, result: "l_304_211_171"),
        .init(lenght: .l_304_211_171, type: .s_4096, result: "f_304_211_171"),
        .init(lenght: .l_304_211_171, type: .pfss, result: "f_304_211_171pfss"),
        .init(lenght: .l_304_211_171, type: .pfssnolines, result: "f_304_211_171pfssnolines"),
        
        //second tab
        .init(lenght: .l_094_335_193, type: .s_256, result: "t_094_335_193"),
        .init(lenght: .l_094_335_193, type: .s_1024, result: "l_094_335_193"),
        .init(lenght: .l_094_335_193, type: .s_4096, result: "f_094_335_193"),
        .init(lenght: .l_094_335_193, type: .pfss, result: "f_094_335_193pfss"),
        .init(lenght: .l_094_335_193, type: .pfssnolines, result: "f_094_335_193pfssnolines"),
        
        .init(lenght: .l_094, type: .s_256, result: "t0094"),
        .init(lenght: .l_094, type: .s_1024, result: "l0094"),
        .init(lenght: .l_094, type: .s_4096, result: "f0094"),
        .init(lenght: .l_094, type: .pfss, result: "f0094pfss"),
        .init(lenght: .l_094, type: .pfssnolines, result: "f0094pfssnolines"),
        
        .init(lenght: .l_335, type: .s_256, result: "t0335"),
        .init(lenght: .l_335, type: .s_1024, result: "l0335"),
        .init(lenght: .l_335, type: .s_4096, result: "f0335"),
        .init(lenght: .l_335, type: .pfss, result: "f0335pfss"),
        .init(lenght: .l_335, type: .pfssnolines, result: "f0335pfssnolines"),
        
        .init(lenght: .l_131, type: .s_256, result: "t0131"),
        .init(lenght: .l_131, type: .s_1024, result: "l0131"),
        .init(lenght: .l_131, type: .s_4096, result: "f0131"),
        .init(lenght: .l_131, type: .pfss, result: "f0131pfss"),
        .init(lenght: .l_131, type: .pfssnolines, result: "f0131pfssnolines"),
        
        //third tab
        .init(lenght: .l_211_193_171, type: .s_256, result: "t_211_193_171"),
        .init(lenght: .l_211_193_171, type: .s_1024, result: "l_211_193_171"),
        .init(lenght: .l_211_193_171, type: .s_4096, result: "f_211_193_171"),
        .init(lenght: .l_211_193_171, type: .pfss, result: "f_211_193_171pfss"),
        .init(lenght: .l_211_193_171, type: .pfssnolines, result: "f_211_193_171pfssnolines"),
        
        .init(lenght: .l_211, type: .s_256, result: "t0211"),
        .init(lenght: .l_211, type: .s_1024, result: "l0211"),
        .init(lenght: .l_211, type: .s_4096, result: "f0211"),
        .init(lenght: .l_211, type: .pfss, result: "f0211pfss"),
        .init(lenght: .l_211, type: .pfssnolines, result: "f0211pfssnolines"),
        
        .init(lenght: .l_193, type: .s_256, result: "t0193"),
        .init(lenght: .l_193, type: .s_1024, result: "l0193"),
        .init(lenght: .l_193, type: .s_4096, result: "f0193"),
        .init(lenght: .l_193, type: .pfss, result: "f0193pfss"),
        .init(lenght: .l_193, type: .pfssnolines, result: "f0193pfssnolines"),
        
        .init(lenght: .l_171, type: .s_256, result: "t0171"),
        .init(lenght: .l_171, type: .s_1024, result: "l0171"),
        .init(lenght: .l_171, type: .s_4096, result: "f0171"),
        .init(lenght: .l_171, type: .pfss, result: "f0171pfss"),
        .init(lenght: .l_171, type: .pfssnolines, result: "f0171pfssnolines"),
        
        //fourth tab
        .init(lenght: .l_hmi_cont, type: .s_256, result: "t_HMI_cont_aiascale"),
        .init(lenght: .l_hmi_cont, type: .s_1024, result: "l_HMI_cont_aiascale"),
        .init(lenght: .l_hmi_cont, type: .s_4096, result: "f_HMI_cont_aiascale"),
        .init(lenght: .l_hmi_cont, type: .pfss, result: ""),
        .init(lenght: .l_hmi_cont, type: .pfssnolines, result: ""),
        
        .init(lenght: .l_hmi_mag, type: .s_256, result: "t_HMImag"),
        .init(lenght: .l_hmi_mag, type: .s_1024, result: "l_HMImag"),
        .init(lenght: .l_hmi_mag, type: .s_4096, result: "f_HMImag"),
        .init(lenght: .l_hmi_mag, type: .pfss, result: "f_HMImagpfss"),
        .init(lenght: .l_hmi_mag, type: .pfssnolines, result: "f_HMImagpfssnolines"),
        
        .init(lenght: .l_hmi_mag_171, type: .s_256, result: "t_HMImag_171"),
        .init(lenght: .l_hmi_mag_171, type: .s_1024, result: "l_HMImag_171"),
        .init(lenght: .l_hmi_mag_171, type: .s_4096, result: "f_HMImag_171"),
        .init(lenght: .l_hmi_mag_171, type: .pfss, result: "f_HMImag_171pfss"),
        .init(lenght: .l_hmi_mag_171, type: .pfssnolines, result: "f_HMImag_171pfssnolines")
    ]

    func testCreatingNameByTypeAndLenght() throws {
        for lenght in WaveLenght.allCases {
            for type in ImageType.allCases {
                
                XCTAssertEqual(SunTodayNameCreator.create(for: lenght, and: type),
                               checkValues.first(where: { $0.lenght == lenght && $0.type == type })?.result)
            }
        }
    }

}

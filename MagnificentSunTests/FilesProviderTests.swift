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

class FilesProviderTests: XCTestCase {
    private let imagesDir = "FilesProviderTests"
    
    override func setUp() {
        FilesProvider.imageDir = imagesDir
        provider.clearImages()
    }
    
    private let provider = FilesProvider()
    
    func testStoringImage() {
        let appDirPath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(imagesDir)
        let date = Date(year: 2020, month: 01, day: 01, hour: 0, minute: 0)
        var sunImage = SunImage(uuid: UUID(), type: .s_4096, wave: .l_304, date: date, imageData: nil)
        
        let datePath = SunTodayDateCreator.urlPath(for: date)
        
        XCTAssertFalse(FilesProvider.isDirectoryExist(for: appDirPath.appendingPathComponent(datePath).path))
        
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: "f_094_335_193", ofType: "jpg")
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        
        sunImage.imageData = data
        
        _ = try! provider.store(sunImage).toBlocking(timeout: 1).first()
        XCTAssertTrue(FilesProvider.isDirectoryExist(for: appDirPath.appendingPathComponent(datePath).path))
        
        XCTAssertTrue(FileManager.default.fileExists(atPath: appDirPath.appendingPathComponent(datePath).appendingPathComponent(sunImage.fileName).path))
    }
    
    func testRequestingImage() {
        let appDirPath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(imagesDir)
        let date = Date(year: 2020, month: 01, day: 01, hour: 0, minute: 0)
        var sunImage = SunImage(uuid: UUID(), type: .s_4096, wave: .l_304, date: date, imageData: nil)
        
        let datePath = SunTodayDateCreator.urlPath(for: date)
        
        XCTAssertFalse(FilesProvider.isDirectoryExist(for: appDirPath.appendingPathComponent(datePath).path))
        
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: "f_094_335_193", ofType: "jpg")
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        
        sunImage.imageData = data
        
        _ = try! provider.store(sunImage).toBlocking().first()
        XCTAssertTrue(FilesProvider.isDirectoryExist(for: appDirPath.appendingPathComponent(datePath).path))
        
        let image = try! provider.requestImage(for: sunImage).toBlocking(timeout: 1).first()
        
        XCTAssertEqual(image?.imageData, data)
    }
}

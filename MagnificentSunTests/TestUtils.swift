//
//  TestUtils.swift
//  MagnificentSunTests
//
//  Created by Konstantin Bondar on 26.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
@testable import MagnificentSun
class TestUtils {
    private let imagesDir: String
    
    init(imagesDir: String) {
        self.imagesDir = imagesDir
        FilesProvider.imageDir = imagesDir
        FilesProvider.clearImages()
    }
    
    func createTestSunImage(lentgh: WaveLenght = .l_304, type: ImageType = .s_1024, date: Date = Date(year: 2020, month: 01, day: 01)) -> SunImage {
        return SunImage(type: type, wave: lentgh, date: date, imageData: nil)
    }
    
    func isDirectoryExist(for image: SunImage) -> Bool {
        return FilesProvider.isDirectoryExist(for: fileDirectoryUrl(for: image).path)
    }
    
    func isFileExist(for image: SunImage) -> Bool {
        return FilesProvider.isFileExist(for: fileUrl(for: image).path)
    }
    
    func clearFiles() {
        FilesProvider.clearImages()
    }
    
    func loadTestImageData(named: String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: named, ofType: "jpg")
        return try! Data(contentsOf: URL(fileURLWithPath: filePath!))
    }
    
    private func fileDirectoryUrl(for sunImage: SunImage) -> URL {
        let datePath = SunTodayDateCreator.urlPath(for: sunImage.date)
        return imageDirUrl.appendingPathComponent(datePath)
    }
    
    private func fileUrl(for sunImage: SunImage) -> URL {
        let directoryUrl = fileDirectoryUrl(for: sunImage)
        return directoryUrl.appendingPathComponent(sunImage.fileName)
    }
    
    private var imageDirUrl: URL {
        return try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(self.imagesDir)
    }
}

extension Date {
    init(year: Int, month: Int, day: Int) {
        self.init(year: year, month: month, day: day, hour: 0, minute: 0)
    }
}

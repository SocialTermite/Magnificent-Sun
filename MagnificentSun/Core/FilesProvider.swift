//
//  FilesProvider.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
import RxSwift

class FilesProvider {
    func requestImage(for sunImage: SunImage) -> Single<SunImage> {
        return Single.create { (single) -> Disposable in
            guard let url = try? self.buildImageURL(sunImage) else {
                single(.error(NSError(domain: "", code: 404, userInfo: [:])))
                return Disposables.create()
            }
            var sunImage = sunImage
            sunImage.imageData = try? Data(contentsOf: url)
            single(.success(sunImage))
            return Disposables.create()
        }
    }
    
    private func buildImageURL(_ sunImage: SunImage) throws -> URL {
        let dateDirectory = sunImage.datePathString
        let directoryPath = try self.imageFiles().appendingPathComponent(dateDirectory)
        try FileManager.default.createDirectory(at: directoryPath,
                                                withIntermediateDirectories: true, attributes: [:])
        
        return directoryPath.appendingPathComponent(sunImage.fileName)
    }
    
    @discardableResult func store(_ sunImage: SunImage) -> Completable {
        return Completable.create { (completable) -> Disposable in
            guard let data = sunImage.imageData else {
                completable(.error(NSError(domain: "", code: 404, userInfo: [:])))
                return  Disposables.create()
            }
            do {
                let fileUrl = try self.buildImageURL(sunImage)
                try data.write(to: fileUrl)
                completable(.completed)
            } catch let error {
                print(error)
                completable(.error(NSError(domain: "", code: 404, userInfo: [:])))
            }
            
            return Disposables.create()
        }
    }
    
    private func appSupportDirectory() throws -> URL {
        return try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private func imageFiles() throws -> URL {
        let imagesUrl = try appSupportDirectory().appendingPathComponent("\(FilesProvider.imageDir)/")
        if !FilesProvider.isDirectoryExist(for: imagesUrl.path) {
            try FileManager.default.createDirectory(at: imagesUrl, withIntermediateDirectories: true, attributes: [:])
        }
        return imagesUrl
    }
    

    
    static func isDirectoryExist(for path: String) -> Bool {
        var isDirectory = ObjCBool(true)
        let exist = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return isDirectory.boolValue && exist
    }
    
    func clearImages() {
        try! FileManager.default.removeItem(at: imageFiles())
    }

    static var imageDir = "images"
}

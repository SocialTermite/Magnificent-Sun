//
//  ImageProvider.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 26.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
import RxSwift

class ImageProvider {
    private let filesProvider = FilesProvider()
    private let api = SunTodayApi()
    
    
    func requestImage(for lenght: WaveLenght, type: ImageType, date: Date) -> Single<SunImage> {
        let sunImage = SunImage(type: type, wave: lenght, date: date, imageData: nil)
        
        return filesProvider.requestImage(for: sunImage).catchError { error in
            if let error = error as? FileProviderError {
                if case FileProviderError.fileNotFound = error {
                    return self.requestApi(for: sunImage)
                }
            }
            return .error(error)
        }
    }
    
    private func requestApi(for sunImage: SunImage) -> Single<SunImage> {
        return api.loadImage(into: sunImage)
            .flatMap({ [filesProvider] sunImage in
                return Single.create { single in
                    let storing = filesProvider.store(sunImage)
                        .subscribe(onCompleted: {
                            single(.success(sunImage))
                        }) { (error) in
                            single(.error(error))
                        }
                    return Disposables.create {
                        storing.dispose()
                    }
                }
            })
    }
    
    func requestImages(with sunImages: [SunImage]) -> Observable<SunImage> {
        return Observable.from(sunImages)
            .flatMap { (image) in
                return self.requestImage(for: image.wave, type: image.type, date: image.date)
            }
    }
}

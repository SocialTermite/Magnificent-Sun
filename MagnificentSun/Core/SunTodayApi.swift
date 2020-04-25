//
//  SunTodayApi.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import RxCocoa
class SunTodayApi {
    func loadImage(into: SunImage) -> Single<SunImage> {
        return Single.create { (single) in
            let url = SunTodayURLCreator.create(for: into.wave, type: into.type, date: into.date)!
            let subscription = RxAlamofire.requestData(.get, url)
                .subscribe(onNext: { response, data in
                    var out = into
                    out.imageData = data
                    single(.success(out))
                })
            
            return Disposables.create {
                subscription.dispose()
            }
        }
    }
}

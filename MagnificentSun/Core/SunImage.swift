//
//  SunImage.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation

struct SunImage {
    let uuid: UUID = UUID()
    var type: ImageType
    var wave: WaveLenght
    var date: Date
    
    var imageData: Data?
}

extension SunImage {
    var datePathString: String {
        return SunTodayDateCreator.urlPath(for: date)
    }
    
    var fileName: String {
        return SunTodayNameCreator.create(for: wave, and: type)
    }
}

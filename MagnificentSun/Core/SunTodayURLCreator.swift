//
//  SunTodayUrlCreator.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation


class SunTodayURLCreator {
    static let host = "http://suntoday.lmsal.com/"
    static let media = "sdomedia/"
    static let sunInTime = "SunInTime/"
    class func create(for lenght: WaveLenght, type: ImageType, date: Date) -> URL? {
        let datePath = SunTodayDateCreator.urlPath(for: date)
        let name = SunTodayNameCreator.create(for: lenght, and: type) + ".jpg"
        guard let url = URL(string: host + media + sunInTime + datePath + name) else {
            fatalError("Wrong url configuration")
        }
        return url
    }
}

//
//  SunTodayDateCreator.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation
import SwiftDate

class SunTodayDateCreator {
    class func urlPath(for date: Date) -> String {
        let year = "\(date.year)"
        let month = "\(date.month)"
        let day = "\(date.day)"
        
        let insertZeroIfNeeded: (String) -> String = { $0.count == 1 ? "0\($0)" : $0 }
        
        return "\(year)/\(insertZeroIfNeeded(month))/\(insertZeroIfNeeded(day))/"
    }
}

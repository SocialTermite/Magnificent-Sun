//
//  MSNameCreator.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 25.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation


class SunTodayNameCreator {
    class func create(for lenght: WaveLenght, and type: ImageType) -> String {
        var prefix = SunTodayNameCreator.prefix(for: type)
        let suffix = SunTodayNameCreator.suffix(for: type)
        
        let name = lenght.rawValue
        if name.count > 4 {
            prefix += "_"
        }
        
        if lenght == .l_hmi_cont && !suffix.isEmpty {
            return ""
        }
        return "\(prefix)\(name)\(suffix)"
    }
    
    private class func prefix(for type: ImageType) -> String {
        switch type {
        case .s_256:
            return "t"
        case .s_1024:
            return "l"
        default:
            return "f"
        }
    }
    
    private static func suffix(for type: ImageType) -> String {
        switch type {
        case .pfss:
            return "pfss"
        case .pfssnolines:
            return "pfssnolines"
        default:
            return ""
        }
    }
}

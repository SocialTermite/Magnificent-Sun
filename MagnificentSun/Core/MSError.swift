//
//  MSError.swift
//  MagnificentSun
//
//  Created by Konstantin Bondar on 26.04.20.
//  Copyright © 2020 SocialTermite. All rights reserved.
//

import Foundation

protocol MSError: Error {
    var description: String { get }
}

enum FileProviderError: MSError {
    case fileNotFound
    case badURL
    case dataNotProvided
    var description: String {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .badURL:
            return "Bad url provided"
        case .dataNotProvided:
            return "Data for store is not provided"
        }
    }
}

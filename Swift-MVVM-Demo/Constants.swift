//
//  Constants.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation
import UIKit

struct API_Str_URLs {
    static let movies = "https://swapi.dev/api/films/"
}

struct CacheKeys {
    static let moviesData = "MoviesDataContainer"
}

extension UIFont {
    struct ThemeFont {
        static let titleFont = UIFont.systemFont(ofSize: 22)
    }
}
extension UIColor {
    struct ThemeColor {
        static let navigationBarTintColor = UIColor.orange
        static let navigationTintColor = UIColor.yellow
        static let titleColor = UIColor.orange
    }
}

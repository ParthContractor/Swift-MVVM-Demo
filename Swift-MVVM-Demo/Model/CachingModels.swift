//
//  CachingModels.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

class MoviesDataContainer: NSObject {
    let data: [Movie]?
    init(data: [Movie]? = nil) {
        self.data = data
    }
}


class MoviesCharactersContainer: NSObject {
    let data: [Character]
    init(data: [Character]) {
        self.data = data
    }
}

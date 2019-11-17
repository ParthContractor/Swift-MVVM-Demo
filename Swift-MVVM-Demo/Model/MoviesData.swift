//
//  MoviesData.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

public struct MoviesData : Decodable {
    let movies: [Movie]?
 
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

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

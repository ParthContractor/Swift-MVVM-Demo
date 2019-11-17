//
//  Movie.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

public struct Movie : Decodable {
    let title: String
    let director: String
    let producer: String
    let release_date: String

    enum CodingKeys: String, CodingKey {
        case title
        case director
        case producer
        case release_date
    }
}

//
//  Movie.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

public struct Movie : Decodable, Equatable {
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
    public static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.director == rhs.director && lhs.producer == rhs.producer && lhs.release_date == rhs.release_date
    }
}

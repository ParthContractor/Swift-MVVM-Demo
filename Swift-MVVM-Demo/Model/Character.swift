//
//  Character.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

public struct Character : Decodable,Equatable {
    let name: String?
 
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    public static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
}

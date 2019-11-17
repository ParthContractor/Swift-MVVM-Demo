//
//  Character.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

public struct Character : Decodable {
    let name: String?
 
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

//
//  Category.swift
//  Ali Bhai
//
//  Created by sinbad on 4/5/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
struct Category : Decodable {
    let id : Int
    let name : String
    let image : [CategoryImage]
}
struct CategoryImage : Decodable {
    let src : String
}

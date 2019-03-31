//
//  Products.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

struct Products : Decodable{
    var id : Int?
    let name : String
    let short_description : String
    let price : String
    let sale_price : String
    let images : [ImagesAll]
}
struct ImagesAll : Decodable {
    let src : String
}

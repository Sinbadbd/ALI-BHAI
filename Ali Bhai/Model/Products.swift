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
    let description: String
    let short_description : String
    let price : String
    let sale_price : String
   // let stock_quantity: String
    let stock_status: String
    let images : [ImagesAll]
    let attributes : AttributesProducts
}
struct ImagesAll : Decodable {
    let src : String
}

struct AttributesProducts : Decodable {
    let id : Int
    let name : String
    let position : Int
    let visible : Bool
    let variation : Bool
    let options : [String] 
}

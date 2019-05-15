//
//  CartResponse.swift
//  Ali Bhai
//
//  Created by sinbad on 5/15/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
struct CartResponse : Decodable {
    let key : String
    let product_name : String
    let product_id : Int
    let variation_id : Int
    let quantity : Int
    
    let line_subtotal : Double
    let line_subtotal_tax : Double
    let line_total : Double
}

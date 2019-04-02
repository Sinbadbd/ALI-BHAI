//
//  ApiClient.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

class ApiClient {
    
    static let key = "?consumer_key=ck_bccca4aa706c500d8af2c6adbaaa2dcf70a41867&consumer_secret=cs_1755b7824ccf632df247ae9ebbf3a811ee19841a"
    
    enum EndPoints {
        static let BASE = "https://devsloop.com/wp-json/wc/v3"
        static let apiKeyParam = key
        case getProducts
        case getProductId(Int)
        
        var stringValue : String {
            switch self {
            case .getProducts: return EndPoints.BASE + "/products" + EndPoints.apiKeyParam
            case .getProductId (let id): return EndPoints.BASE + "/products/\(id)" +  EndPoints.apiKeyParam
            }
        }
        var url : URL{
            return URL(string: stringValue)!
        }
    }
 
    class func getAllProducts (completion: @escaping([Products]?,Error?)->Void) {
        let task = URLSession.shared.dataTask(with: ApiClient.EndPoints.getProducts.url) { (data, respnse, error) in
            
            if let error = error {
                completion(nil, error)
                print("Something went to worng!", error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode([Products].self, from: data!)
                completion(responseData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    class func getProdutsId (id : Int, completion: @escaping(Products?,Error?)->Void) {
       //print(ApiClient.EndPoints.getProductId(id).url)
        let task = URLSession.shared.dataTask(with: ApiClient.EndPoints.getProductId(id).url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("Somethings went to worng", error)
            }
            do {
                let decoder = JSONDecoder()
                
                let responseData = try decoder.decode(Products.self, from: data!)
                print("responseDa -----\(responseData)")
                completion(responseData, nil)
            } catch {
                completion(nil, error)
            }
            
        }
        task.resume()
    }
}

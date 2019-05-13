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
        static let CART_BASE_URL = "https://devsloop.com/wp-json/wc/v2/"
        static let apiKeyParam = key
        case getProducts
        case getProductId(Int)
        case getCategory
        case getCategoryId(Int)
        
        //cart information: @coCart
        case getCart
        case clearCart
        case getCartCountItem
        case getCartTotals
        case cartTotalCalculate
        case addToCart
        case cartItemUpdate
        case cartItemRemove
        
        var stringValue : String {
            switch self {
            case .getProducts: return EndPoints.BASE + "/products" + EndPoints.apiKeyParam
            case .getProductId (let id): return EndPoints.BASE + "/products/\(id)" +  EndPoints.apiKeyParam
            case .getCategory: return EndPoints.BASE + "/products/categories" + EndPoints.apiKeyParam
            case .getCategoryId (let id): return EndPoints.BASE + "/products/categories/(id)" + EndPoints.apiKeyParam
         
            
            // cart endpoints: @coCart
            case .getCart: return EndPoints.CART_BASE_URL + "cart" + EndPoints.apiKeyParam
            case .getCartCountItem: return EndPoints.CART_BASE_URL + "cart/count-items" + EndPoints.apiKeyParam
            case .cartTotalCalculate: return EndPoints.CART_BASE_URL + "cart/calculate" + EndPoints.apiKeyParam
            case .getCartTotals: return EndPoints.CART_BASE_URL + "cart/totals" + EndPoints.apiKeyParam
            case .addToCart: return EndPoints.CART_BASE_URL + "cart/add" + EndPoints.apiKeyParam
            case .cartItemUpdate: return EndPoints.CART_BASE_URL + "cart/cart-item" + EndPoints.apiKeyParam
            case .cartItemRemove: return EndPoints.CART_BASE_URL + "cart/cart-item" + EndPoints.apiKeyParam
            case .clearCart: return EndPoints.CART_BASE_URL + "cart/clear" + EndPoints.apiKeyParam
            
            }
        }
        var url : URL{
            return URL(string: stringValue)!
        }
    }
    
    // CREATE @GET REQUEST
    class func taskForGetRequest<ResponseType: Decodable>(url:URL, response: ResponseType.Type, completion: @escaping(ResponseType?, Error?)->Void){
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    
    
    class func getAllProducts (completion: @escaping([Products]?,Error?)->Void) {
        
        taskForGetRequest(url: ApiClient.EndPoints.getProducts.url, response: [Products].self) { (response, error) in
            if let response  = response {
                //print(response)
                completion(response, nil)
            } else {
                completion([], error)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    class func getProdutsId (id : Int, completion: @escaping(Products?,Error?)->Void) {
        taskForGetRequest(url: ApiClient.EndPoints.getProductId(id).url, response: Products.self) { (response, error) in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    
    class func getAllCategory(completion: @escaping([Category]?, Error?)->Void){
        print(ApiClient.EndPoints.getCategory.url)
        taskForGetRequest(url: ApiClient.EndPoints.getCategory.url, response: [Category].self) { (response, error) in
            if let response = response {
                completion(response, nil)
                      print("cat\(response)")
            } else {
                completion(nil, error)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
}

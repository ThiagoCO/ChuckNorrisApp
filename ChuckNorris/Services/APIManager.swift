//
//  APIManager.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 27/11/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    func getCategories(completed: @escaping (_ categories: Categories?) -> Void) {
        
        let url = "https://api.chucknorris.io/jokes/categories"
    
        Alamofire.request(url, method: .get).responseData { (response) in
            if let data = response.data {
                let list = try? JSONDecoder().decode(Categories.self, from: data)
                completed(list)
            }
        }
    }
    
    func getCategoryDetail(category:String,_ completed:@escaping(_ detail: CategoryDetail?) -> Void) {
        let url = "https://api.chucknorris.io/jokes/random?category=\(category)"
        
        Alamofire.request(url, method: .get).responseData { (response) in
            if let data = response.data {
                let detail = try? JSONDecoder().decode(CategoryDetail.self, from: data)
                completed(detail)
            }
        }
    }
    
    func getImageDetail(completed:@escaping(_ data:Data) -> Void) {
        
        let url = "https://assets.chucknorris.host/img/avatar/chuck-norris.png"
        
        Alamofire.request(url, method: .get).responseData { (response) in
            if let data = response.data {
                completed(data as Data)
            }
        }
    }
}

//
//  ServiceNew.swift
//  LikePhoto
//
//  Created by Артем on 19.06.2023.
//

import Foundation
import UIKit


struct Dates {
  
    var dates = [(name: String , pass: String , age: Int)]()
}


struct Dates1: Identifiable, Codable {
    var id = UUID()
    
    var name: String
    var password: String
    var age : Int

}


struct Result : Codable {
    var result2 : [Dates1]
}


class Base {
   static let APIo = "https://loremflickr.com/320/240"
    static let shared = Base()
    struct DatesNew:  Codable {
      
        var name: String
        var password: String
        var age : Int

    }
    
    var baseArray : [DatesNew] {
        get{
            if let data = UserDefaults.standard.value(forKey: "base") as? Data {
                return try! PropertyListDecoder().decode([DatesNew].self, from: data)
                
            }else {
                return [DatesNew]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "base")
            }
        }
    }
    
    func saveBase(name: String, password: String , age: Int) {
        
        let base = DatesNew(name: name, password: password, age: age)
        baseArray.insert(base, at: 0)
    }
    
    
    func APIService(completion: @escaping (UIImage , URL?)  -> Void ){
        
        let API = Base.APIo

                guard let apiURL = URL(string: API) else {
                    fatalError("some Error")
                }

                let session = URLSession(configuration: .default)

                let task = session.dataTask(with: apiURL) {(data , response , error) in
                    guard let data = data  , error == nil else { return }
                    DispatchQueue.main.async { 
                    
               
                       
//                        self.imageSearch.image = UIImage(data: data)
                        completion(UIImage(data: data) ?? UIImage(), response?.url)
            
                    }
                }
                task.resume()
    }
    
    
    
}

class Pups {
    
    static let shared = Pups()
    
    func APIService(completion: @escaping (UIImage , URL?)  -> Void ){
        
             let API = "https://loremflickr.com/320/240"

                guard let apiURL = URL(string: API) else {
                    fatalError("some Error")
                }

                let session = URLSession(configuration: .default)

                let task = session.dataTask(with: apiURL) {(data , response , error) in
                    guard let data = data  , error == nil else { return }
                    DispatchQueue.main.async {
                    
               
                       
//                        self.imageSearch.image = UIImage(data: data)
                        completion(UIImage(data: data) ?? UIImage(), response?.url)
            
                    }
                }
                task.resume()
    }
    
    
    
}

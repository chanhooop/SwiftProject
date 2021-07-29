//
//  QueryModel.swift
//  BabyProject
//
//  Created by 이찬호 on 2021/07/29.
//

import Foundation


protocol QueryModelProtocol {
    func itemDownloaded(items: NSArray)
}

class QueryModel: NSObject{
    var delegate: QueryModelProtocol!
    let urlPath = Share().url("bebeHome_select.jsp")
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
            
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray  // json파일을 nsarray배열로 바꿔줌
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let itemtitle = jsonElement["itemtitle"] as? String,
               let address = jsonElement["address"] as? String,
               let babyage = jsonElement["babyage"] as? String,
               let itemimage = jsonElement["itemimage"] as? String{
                let query = DBModel(itemtitle: itemtitle, address: address, babyage: babyage, itemimage: itemimage)
                locations.add(query)
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
    
}

//
//  Share.swift
//  BabyProject
//
//  Created by 이찬호 on 2021/07/29.
//

import Foundation

struct Share{
    
    func url(_ fileName: String) -> String{
        let url = "http://192.168.5.62:8080/bebeProject/\(fileName)"
        return url
    }
    
    func imgUrl(_ fileName: String) -> String{
        let url = "http://192.168.5.62:8080/bebeProject/image/\(fileName)"
        return url
    }
    
}

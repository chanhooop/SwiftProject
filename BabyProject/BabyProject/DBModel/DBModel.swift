//
//  DBModel.swift
//  BabyProject
//
//  Created by 이찬호 on 2021/07/29.
//

import Foundation

import Foundation
class DBModel: NSObject{
    var itemtitle: String?
    var address: String?
    var babyage: String?
    var itemimage: String?
    
    // Empty constructor
    override init() {
        
    }
    
    init(itemtitle: String, address: String, babyage: String, itemimage: String) {
        self.itemtitle = itemtitle
        self.address = address
        self.babyage = babyage
        self.itemimage = itemimage
    }
}

//
//  JSONLoader.swift
//  Inventory
//
//  Created by Brock Gibson on 4/15/19.
//  Copyright © 2019 Brock Gibson. All rights reserved.
//

import Foundation

class JSONLoader {
    
    class func loadInventory(jsonFileName: String) -> Inventory? {
        var inventory: Inventory?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            inventory = try? jsonDecoder.decode(Inventory.self, from: jsonData)
        }
        
        return inventory
    }
}

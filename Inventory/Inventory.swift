//
//  Inventory.swift
//  Inventory
//
//  Created by Brock Gibson on 4/15/19.
//  Copyright © 2019 Brock Gibson. All rights reserved.
//

import Foundation

struct Inventory: Codable {
    var status: String
    var products: [Item]
}

struct Item: Codable {
    var id: Int
    var category: String
    var title: String
    var price: Double
    var stockedQuantity: Int
}

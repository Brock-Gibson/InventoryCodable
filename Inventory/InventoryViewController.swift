//
//  ViewController.swift
//  Inventory
//
//  Created by Brock Gibson on 4/15/19.
//  Copyright © 2019 Brock Gibson. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var inventoryTableView: UITableView!
    var inventory: Inventory?
    let jsonFile = "inventory"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inventoryTableView.dataSource = self
        inventoryTableView.delegate = self
        
        inventory = JSONLoader.loadInventory(jsonFileName: jsonFile)
        
        if inventory == nil {
            print("Unable to load and parse \(jsonFile).json")
        } else {
            print("\(jsonFile).json successfully loaded and parsed.")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = inventoryTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        if let product = inventory?.products[indexPath.row] {
            cell.detailTextLabel?.text = "Quantity in Stock: \(product.stockedQuantity)"
            cell.textLabel?.text = product.title
        }

        return cell
    }
}

//
//  Tab.swift
//  NightlyBudgetApp
//
//  Created by Danny on 11/17/24.
//

import Foundation
import SwiftData

@Model
class Tab{
    var Name : String
    var Items : [PurchaseItem]
    
    init(Name: String="", Items: [PurchaseItem] = [])
    {
        self.Name = Name
        self.Items = Items
    }
}

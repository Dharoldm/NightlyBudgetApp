//
//  PurchaseItem.swift
//  NightlyBudgetApp
//
//  Created by Danny on 11/14/24.
//

import Foundation
import SwiftData

@Model
class PurchaseItem{
    var id = UUID()
    var Name: String
    var Price: Int
    
    init(Name: String="", Price: Int=0){
        self.Name = Name
        self.Price = Price
    }
}
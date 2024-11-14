//
//  Budget.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import Foundation
import SwiftUI

class Budget: ObservableObject{
    
    @Published var currentBudge : Int  = 0
    @Published var items: [PurchaseItem] = []
    init(price: Int, name: String) {
        self.items.append(PurchaseItem(Name:name, Price:price))
        }
    
    init() {
        
    }
    
    init(preloads: [PurchaseItem])
    {
        for item in preloads
        {
            self.items.append(item)
        }
        
    }
    
    func transaction ( amount: Int)
    {
        print("We have updated budget by " + String(amount))
        currentBudge += amount
        print("Currentbudge is now "+String(currentBudge))
        
    }
    func addItem(amount: Int, name: String)
    {
        self.items.append(PurchaseItem(Name:name, Price:amount))
    
    }
}



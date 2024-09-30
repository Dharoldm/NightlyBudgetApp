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
    
    
    func transaction ( amount: Int)
    {
        print("We have updated budget by " + String(amount))
        currentBudge += amount
        print("Currentbudge is now "+String(currentBudge))
        
    }
}

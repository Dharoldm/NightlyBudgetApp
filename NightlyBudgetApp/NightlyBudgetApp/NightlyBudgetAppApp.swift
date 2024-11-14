//
//  NightlyBudgetAppApp.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI
import SwiftData

@main
struct NightlyBudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            //Query var items: [PurchaseItem]
            let budget = Budget()
            ContentView(budgeteyman:budget)
        }
        .modelContainer(for: PurchaseItem.self)
    }
        
}




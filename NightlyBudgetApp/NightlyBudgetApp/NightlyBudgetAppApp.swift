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
            TabsView()
        }
        .modelContainer(for: Tab.self)
    }
        
}




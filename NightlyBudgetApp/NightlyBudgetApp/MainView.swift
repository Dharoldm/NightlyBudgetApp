//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var items = [
        PurchaseItem(Name:"Coke", Price: 20)
    ]
    
    var body: some View {
        Text("Here's what you bought")
        List(items) { item in
            HStack(){
                Text(item.Name)
                Text(String(item.Price))
                
            }
        }.padding().listStyle(InsetGroupedListStyle())
        
    }
}

struct PurchaseItem : Identifiable{
    var id = UUID()
    var Name: String
    var Price: Int

}

#Preview {
    ContentView()
}

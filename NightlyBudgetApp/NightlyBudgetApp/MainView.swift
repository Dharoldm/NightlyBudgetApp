//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var budgeteyman : Budget
    @State var items = [
        PurchaseItem(Name:"Coke", Price: 200),
        PurchaseItem(Name:"Pepsi", Price: 20)
    ]
    @State var currentTotal = 0
    var body: some View {
        Text("Here's what you bought")
        List(items) { item in
            HStack(){
                Text(item.Name)
                Text(String(item.Price))
                
            }.onAppear{
                budgeteyman.transaction(amount: item.Price)
            }
        }.padding().listStyle(InsetGroupedListStyle())
        Text("You have spent "+String(budgeteyman.currentBudge))
    }
}

struct PurchaseItem : Identifiable{
    var id = UUID()
    var Name: String
    var Price: Int

}

#Preview {
    let budget = Budget()
    ContentView(budgeteyman : budget)
}

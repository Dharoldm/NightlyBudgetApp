//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var budgeteyman : Budget
    @State var currentTotal = 0
    var body: some View {
        Text("Here's what you bought")
        
        List(budgeteyman.items) { item in
            HStack(){
                Text(item.Name)
                Text(String(item.Price))
                
            }.onAppear{
                budgeteyman.transaction(amount: item.Price)
            }
        }.padding().listStyle(InsetGroupedListStyle())
        Button(
                 action: {
                     budgeteyman.addItem(amount: 4, name: "newItem")
                 }
        )
        {
            Image(systemName: "plus")
                .resizable()
                .padding(6)
                .frame(width: 24, height: 24)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
        }
        Text("You have spent "+String(budgeteyman.currentBudge))
    }
}



#Preview {
    let budget = Budget()
    ContentView(budgeteyman : budget)
}

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
    @State private var name: String = "Tim"
    let paddingAmount: CGFloat = 20
    var body: some View {
        Text("Here's what you bought")
            .padding()
        VStack(alignment: .leading){
            
            
            List(budgeteyman.items) { item in
                HStack(){
                    Text(item.Name)
                    Text(String(item.Price))
                    
                }.onAppear{
                    budgeteyman.transaction(amount: item.Price)
                }.background(Color.green)
            }.padding(.leading, paddingAmount) .listStyle(PlainListStyle())
                .frame(maxHeight: CGFloat(budgeteyman.items.count * 42)) // Assuming each row height is around 44
                .background(Color.blue) //To show extra space
                //.listRowInsets(EdgeInsets())
                //.scrollContentBackground(.hidden)
            HStack{
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
                .padding(.leading, paddingAmount)
            }
            Text("You have spent "+String(budgeteyman.currentBudge))
            //TextField("Enter your name", text: $name)
            //            Text("Hello, \(name)!")
        }
    }
}



#Preview {
    let budget = Budget()
    ContentView(budgeteyman : budget)
}

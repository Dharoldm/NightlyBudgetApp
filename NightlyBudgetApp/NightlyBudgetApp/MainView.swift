//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var budgeteyman : Budget
    @State var amount = "0"
    @State private var name: String = "Nothing"
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
                    budgeteyman.addItem(amount: Int(amount) ?? 0, name: name)
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
                    TextField(text: $name, prompt: Text("Required")) {
                        Text("Username")
                    }
                TextField(text: $amount, prompt: Text("Required")) {
                        Text("Password")
                    }
                
            }
            
            //TextField("Enter your name", text: $name)
            //            Text("Hello, \(name)!")
        }
        Text("You have spent "+String(budgeteyman.currentBudge))
    }
}


#Preview {
    let budget = Budget()
    ContentView(budgeteyman : budget)
}

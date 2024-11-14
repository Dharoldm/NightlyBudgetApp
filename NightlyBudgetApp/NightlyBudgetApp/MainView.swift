//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var items: [PurchaseItem]
    @Environment(\.modelContext) var modelContext
    @StateObject var budgeteyman : Budget
    @State var amount = "0"
    @State private var name: String = "Nothing"

    
    let paddingAmount: CGFloat = 20
    var body: some View {
        Text("Here's what you bought")
            .padding()
        VStack(alignment: .center){
            
            if items.isEmpty {
                // Fallback view when the array is empty
                Text("Add an item to the list!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            else{
                List{ ForEach(items) { item in
                    HStack(){
                        Text(item.Name)
                        Text(String(item.Price))
                        
                    }.onAppear{
                        budgeteyman.transaction(amount: item.Price)
                    }
                    //.background(Color.green)
                    
                }.onDelete(perform: deletePurchaseItems)
                .padding(.leading, paddingAmount) .listStyle(PlainListStyle())
                .frame(maxHeight: CGFloat(budgeteyman.items.count * 42)) // Assuming each row height is around 44
                    
                    //.background(Color.blue) //To show extra space
                    //.listRowInsets(EdgeInsets())
                    //.scrollContentBackground(.hidden)
                }
            }
            HStack{
                Button(
                    action: {
                        addSomething()
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
                .padding(.leading, paddingAmount-12)
                TextField(text: $name, prompt: Text("Required")) {
                    Text("Username")
                }.background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)) // Add rounded rectangle around TextField
                
                TextField(text: $amount, prompt: Text("Required")) {
                    Text("Password")
                }.background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)) // Add rounded rectangle around TextField
                
                
            }
            
        }
        Text("You have spent "+String(budgeteyman.currentBudge))
        
    }
    func addSomething(){
        budgeteyman.addItem(amount: Int(amount) ?? 0, name: name)
        let item = PurchaseItem(Name: name, Price: Int(amount) ?? 0)
        modelContext.insert(item)
    }
    
    func deletePurchaseItems(_ indexSet: IndexSet){
        for index in indexSet {
            let purchaseItem = items[index]
            modelContext.delete(purchaseItem)
            budgeteyman.transaction(amount: purchaseItem.Price * -1)
        }
    }
}


#Preview {
    @Previewable @Query var items: [PurchaseItem]
    let budget = Budget()
    ContentView(budgeteyman : budget)
}

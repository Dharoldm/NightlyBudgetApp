//
//  ContentView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 9/27/24.
//

import SwiftUI
import SwiftData

struct TabView: View {
    @Query var tabs: [Tab]
    var tab : Tab
    @Environment(\.modelContext) var modelContext
    @State var amount = "0"
    @State private var name: String = "Nothing"

    
    let paddingAmount: CGFloat = 20
    var body: some View {
        Text("Here's what you bought from "+tab.Name)
            .padding()
        VStack(alignment: .center){
            
            if tab.Items.isEmpty {
                // Fallback view when the array is empty
                Text("Add an item to the list!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            else{
                List{ ForEach(tab.Items) { item in
                    HStack(){
                        Text(item.Name)
                        Text(String(item.Price))
                        
                    }
                    //.background(Color.green)
                    
                }.onDelete(perform: deletePurchaseItems)
                .padding(.leading, paddingAmount) .listStyle(PlainListStyle())
                .frame(maxHeight: CGFloat(tab.Items.count * 42)) // Assuming each row height is around 44
                    
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
        Text("You have spent "+String(GetTotal()))
        
    }
    func addSomething(){
        let item = PurchaseItem(Name: name, Price: Int(amount) ?? 0)
        tab.Items.insert(item, at: tab.Items.endIndex)
    }
    
    func GetTotal() -> Int{
        var total = 0
        for item in tab.Items{
                total = total + item.Price
            }
        return total
        }
             
    func deletePurchaseItems(_ indexSet: IndexSet){
        for index in indexSet {
            let purchaseItem = tab.Items[index]
            modelContext.delete(purchaseItem)
        }
    }
}


#Preview {
    @Previewable @Query var items: [PurchaseItem]
    let example : Tab = Tab(Name: "Example")
    TabView(tab: example)
}

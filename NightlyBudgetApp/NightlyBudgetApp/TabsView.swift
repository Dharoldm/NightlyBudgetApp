//
//  TabsView.swift
//  NightlyBudgetApp
//
//  Created by Danny on 11/18/24.
//

import SwiftUI
import SwiftData


struct TabsView: View{
    @Query var tabs: [Tab]
    @Environment(\.modelContext) var modelContext
    let paddingAmount : CGFloat = 20
    @State private var name: String = "Nothing"
    
    var body : some View{
        NavigationStack{
            List{
                ForEach(tabs) { tab in
                    VStack(alignment: .leading){
                        NavigationLink(destination: TabView(tab: tab)) {
                            Text(tab.Name)
                        }
                        
                    }
                }
            }
        }.navigationTitle("Tabulation")
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
            
            
            
        }
    }
    
    func addSomething(){
        let tab = Tab(Name: name)
        modelContext.insert(tab)
    }
}

#Preview {
    TabsView()
}

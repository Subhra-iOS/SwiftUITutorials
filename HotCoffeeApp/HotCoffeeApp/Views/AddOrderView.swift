//
//  AddOrderView.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 05/01/22.
//

import SwiftUI

struct AddOrderView: View {
    
    @State private var addOrderViewModel = AddOrderViewModel(dbManager: CoreDataManager(stack: CoreDataStack.shared))
    
    @Binding var isOpen: Bool
    
    var body: some View {
        
        NavigationView {
            Group {
                VStack{
                    TextField("Enter name", text: self.$addOrderViewModel.userName)
                        .font(.custom("Arial", size: 25))
                        .padding()
                    Picker(selection: self.$addOrderViewModel.coffeeType, label: Text("Selection"), content: {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("ex")
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Button("Submit") {
                        
                        self.addOrderViewModel.saveOrder()
                        self.isOpen = false
                    }
                    .frame(width: 200, height: 44, alignment: .center)
                    .font(.custom("Arial", size: 25))
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10.0)
                   
                }.padding()
            }
            .navigationTitle("Add Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isOpen: .constant(false))
    }
}

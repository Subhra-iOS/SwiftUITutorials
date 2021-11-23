//
//  AddCoffeeOrderView.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 23/11/21.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderViewModel: AddCoffeOrderViewModel
    
    init(addCoffeeViewModel: AddCoffeOrderViewModel) {
        self.addCoffeeOrderViewModel = addCoffeeViewModel
    }
    
    var body: some View {
                
        NavigationView{
            
            VStack{
                Form{
                    Section(header: Text("Information")
                                .font(.body)) {
                        TextField("Enter name", text: $addCoffeeOrderViewModel.name)
                    }
                    
                    Section(header: Text("Select coffee")
                                .font(.body)) {
                        ForEach(addCoffeeOrderViewModel.addCoffeModels, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderViewModel.coffeName)
                        }
                    }
                    
                    Section(header: Text("Select size").font(.body),
                            footer: OrderTotalView(total: self.addCoffeeOrderViewModel.total)) {
                        Picker("", selection: $addCoffeeOrderViewModel.size) {
                            Text("Small").tag("small")
                            Text("Medium").tag("medium")
                            Text("Large").tag("large")
                        }.pickerStyle(SegmentedPickerStyle())
            
                    }
                }
                
                HStack {
                    Button("Place order") {
                        
                    }
                }.padding(EdgeInsets(top: 10.0, leading: 100.0, bottom: 10.0, trailing: 100.0))
                .foregroundColor(.white)
                .background(Color(red: (46.0/255.0), green: (204.0/255.0), blue: (113.0/255.0), opacity: 1.0))
                .cornerRadius(10.0)
            }
            .navigationBarTitle("Add order")
        }
    }
}

struct CoffeeCellView: View {
    let coffee: AddCoffeeModel
    @Binding var selection: String
    
   
    var body: some View {
        HStack {
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .cornerRadius(10.0)
            Text(coffee.name)
                .font(.title2)
                .padding(EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 10.0))
            Spacer()
            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = coffee.name
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(addCoffeeViewModel: AddCoffeOrderViewModel(service: Webservice(), coffeList: Coffee.allTypes()))
    }
}

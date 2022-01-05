//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 04/01/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var privateContext: NSManagedObjectContext
    @ObservedObject var orderListVM: OrderListViewModel = OrderListViewModel(dbManager: CoreDataManager(stack: CoreDataStack.shared))
    
    @State private var isOpen: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(self.orderListVM.orders, id: \.self) { order in
                    OrderTypeCell(orderType: order)
                }
            }
            .sheet(isPresented: self.$isOpen, content: {
                AddOrderView()
            })
            .navigationTitle("Orders")
            .navigationBarItems(trailing: Button(action: {
                self.isOpen = true
            }, label: {
                Text("+")
            }))
        }
    }
}

struct OrderTypeCell: View {
    let orderType: OrderViewModel
    var body: some View{
        HStack{
            Image(orderType.type)
                .resizable()
                .frame(width: 60, height: 60, alignment: .leading)
                .cornerRadius(10)
            Text(orderType.name)
                .font(.title)
                .foregroundColor(.gray)
                .padding([.leading], 10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

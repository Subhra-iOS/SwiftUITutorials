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
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(self.orderListVM.orders, id: \.self) { order in
                    OrderTypeCell(orderType: order)
                }.onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let orderVM = self.orderListVM.orders[index]
                        self.orderListVM.deleteOrder(orderVM)
                    }
                })
            }
            .sheet(isPresented: self.$isPresented, onDismiss: {
                print("On Dismiss")
                self.orderListVM.fetchAllOrders()
            } , content: {
                AddOrderView(isOpen: self.$isPresented)
            })
            .navigationTitle("Orders")
            .navigationBarItems(trailing: Button(action: {
                self.isPresented = true
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

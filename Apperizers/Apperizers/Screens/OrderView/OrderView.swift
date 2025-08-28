//
//  OrderView.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            NavigationStack {
                
                List() {
                    ForEach(order.items) { appetizer in
                        AppetizerCellView(appetizer: appetizer)
                    }
                    .onDelete(perform: order.deleteItems)
                    
                    /* Note: Alternative (less compact but same funcionality)
                     .onDelete(perform: { indexSet in
                     orderedItems.remove(atOffsets: indexSet)
                     })
                     */
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🧾 Orders")
                
                Spacer()
                
                Button {
                    print("ciao")
                } label: {
                    AppetizerButton(title: "$" + String(order.totalPrice) + " - Place Order")
                }.padding(.bottom, 25)
    
            }
            
            if order.items.isEmpty {
                EmptyState(imageName: "empty-order",
                           message: "You have no items in you order.\n Please add an appetizer!")
                
            }
        }
    }
}

#Preview {
    OrderView()
}

//
//  Order.swift
//  Apperizers
//
//  Created by Matteo on 27/08/25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items = [Appetizer]()
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    var numberOfItems: Int {
        items.count
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

    

//
//  Appetizer.swift
//
//  Created by Matteo on 18/08/25.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "good food",
                                           price: 12.99,
                                           imageURL: "",
                                           calories: 120,
                                           protein: 10,
                                           carbs: 90)

    static let appetizers = [ sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer ]
}

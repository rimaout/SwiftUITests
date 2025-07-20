//
//  weatherButton.swift
//  Simpleweather
//
//  Created by Matteo on 19/07/25.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 54, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 22, weight: .bold))
            .cornerRadius(15)
    }
}

//
//  AppetizerDetailCardView.swift
//  Apperizers
//
//  Created by Matteo on 19/08/25.
//

import SwiftUI

struct AppetizerDetailCardView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40) {
                NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                NutritionInfo(title: "Carbs", value: "\(appetizer.carbs)")
                NutritionInfo(title: "proteins", value: "\(appetizer.protein)")
            }
            
            Spacer()
            
            Button {
                print("")
            } label: {
                AppetizerButton(title: String(appetizer.price) + " - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button() {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }
        }
    }
}

struct NutritionInfo: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailCardView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
}

//
//  ContentView.swift
//  Simpleweather
//
//  Created by Matteo on 18/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors:[.blue, .white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all) // back ground color can ingnore safa area
            
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight:.medium,))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 140)
                    
                    Text("28°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack {
                    
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", tempVal: 28)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", tempVal: 32)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", tempVal: 25)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sun.horizon.fill", tempVal: 12)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "moon.stars.fill", tempVal: 19)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 54, alignment: .center)
                        .background(Color.white)
                        .font(.system(size: 22, weight: .bold))
                        .cornerRadius(15)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var tempVal: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 50)
            
            Text("\(tempVal)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

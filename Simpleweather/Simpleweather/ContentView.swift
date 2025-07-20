//
//  ContentView.swift
//  Simpleweather
//
//  Created by Matteo on 18/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
                
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                if isNight {
                    MainWeatherStatusView(imageName: "moon.stars.fill", tempVal: 28)
                } else {
                    MainWeatherStatusView(imageName: "cloud.sun.fill", tempVal: 28)
                }
                
                HStack {
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", tempVal: 28)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", tempVal: 32)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind", tempVal: 25)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sun.horizon.fill", tempVal: 12)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "moon.stars.fill", tempVal: 19)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: isNight ? Color("darkBlue") : .blue)
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

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [isNight ? Color("darkBlue") : .blue,
                                             isNight ? Color("horizonBlue") : .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all) // back ground color can ingnore safa area
    }
}

struct CityTextView : View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight:.medium,))
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.bottom, 40)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var tempVal: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 130)
                .padding(.bottom, 10)
            
            Text("\(tempVal)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

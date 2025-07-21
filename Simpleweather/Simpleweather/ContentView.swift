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
            
            BackgroundView(isNight: isNight)
                
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                if isNight {
                    MainWeatherStatusView(imageName: "moon.stars.fill", tempVal: 28)
                } else {
                    MainWeatherStatusView(imageName: "cloud.sun.fill", tempVal: 28)
                }
                
                HStack {
                    WeatherDayView(isNight: isNight, dayOfWeek: "Tue", imageName: "cloud.sun.fill", tempVal: 28)
                    WeatherDayView(isNight: isNight, dayOfWeek: "Wed", imageName: "sun.max.fill", tempVal: 32)
                    WeatherDayView(isNight: isNight, dayOfWeek: "Thu", imageName: "wind", tempVal: 25)
                    WeatherDayView(isNight: isNight, dayOfWeek: "Fri", imageName: "sun.horizon.fill", tempVal: 12)
                    WeatherDayView(isNight: isNight, dayOfWeek: "Sat", imageName: "moon.stars.fill", tempVal: 19)
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
    var isNight: Bool
    var dayOfWeek: String
    var imageName: String
    var tempVal: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
            
            // .symbolRenderingMode(.palette) can be used to modify the color of each layer of the icon using foregroundStyle(.color1, .color2, .color3)

            // .symbolRenderingMode(.hierarchical) renders monochrome icons, where each layer has a different opacity. The color of the icon can be chosen using .foregroundColor(.color1)

            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(
                    .white,
                    isNight ? .orange : .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 50)
            
            Text("\(tempVal)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [isNight ? Color("darkBlue") : .blue,
                                             isNight ? Color("horizonBlue") : .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all) // safe area is used to fill the entire screen
        
        // Alternative gradient method (less customizable, It's what Apple uses for its products):
        // - can't use multiple colors
        // - more subtle
        //
        //ContainerRelativeShape()
        //    .fill(isNight ? Color("darkBlue").gradient : Color.blue.gradient)
        //    .edgesIgnoringSafeArea(.all)
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

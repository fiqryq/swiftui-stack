//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Fiqry Choerudin on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Bandung, ID")
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("25°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom,40)
                HStack(spacing:12) {
                    WeatherDayItemView(dayOfWeek: "TUE", imageName: "cloud.sun.bolt.fill" , temp: 20)
                    WeatherDayItemView(dayOfWeek: "WED", imageName: "sun.max.fill" , temp: 27)
                    WeatherDayItemView(dayOfWeek: "THU", imageName: "wind.snow" , temp: 18)
                    WeatherDayItemView(dayOfWeek: "FRI", imageName: "sunset.fill" , temp: 20)
                    WeatherDayItemView(dayOfWeek: "SAT", imageName: "snow" , temp: 5)
                }
                Spacer()
                Button {
                    print("clicked")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 300, height: 60)
                        .background(.white)
                        .font(.system(size: 20,weight: .bold))
                        .cornerRadius(10)
                }
                Spacer()
            }
   
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayItemView: View {
    var dayOfWeek:String
    var imageName:String
    var temp:Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temp)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
    }
}

struct CityTextView:View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

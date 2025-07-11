//
//  ContentView.swift
//  WeatherReportApp
//
//  Created by Mehta, Harshal on 2025-07-09.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature: String = "20"
    @State private var weatherMessage: String = ""
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TextField("Enter temperature (°C)", text: $temperature)
                    .padding()
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button(action: {
                    if let temp = Int(temperature) {
                        switch temp {
                        case Int.min..<0:
                            weatherMessage = "It's freezing!"
                            backgroundColor = .blue
                        case 0..<15:
                            weatherMessage = "It's cold"
                            backgroundColor = .cyan
                        case 15..<30:
                            weatherMessage = "It's warm"
                            backgroundColor = .yellow
                        case 30..<40:
                            weatherMessage = "It's hot!"
                            backgroundColor = .orange
                        case 40..<50:
                            weatherMessage = "It's very hot!"
                            backgroundColor = .red
                        case 50...Int.max:
                            weatherMessage = "It's dangerously hot!"
                            backgroundColor = .red.opacity(0.8)
                        default:
                            weatherMessage = "Temperature out of range"
                            backgroundColor = .gray
                        }
                    } else {
                        weatherMessage = "Please enter a valid number."
                        backgroundColor = .gray
                    }
                }) {
                    Text("Check Weather")
                        .font(.title3.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                Text(weatherMessage)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

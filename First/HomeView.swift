//
//  HomeView.swift
//  First
//
//  Created by Brandon McConathy on 3/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var darkMode: Bool
    
    @State private var distance = 75.0
    @State private var daysPerWeek = 6.0
    @State private var longRunPercent = 0.25
    
    var body: some View {
        
        VStack {
            Text("Running Schedule")
                .font(.system(size: 28))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            HStack {
                Button {
                    distance -= 1
                } label: {
                    Image(systemName: "minus")
                }
                    .font(.system(size: 25))
                    .disabled(distance == 0 ? true : false)
                    .foregroundColor(distance == 0 ? .gray : .blue)
                Slider(
                    value: $distance,
                    in: 0...150,
                    step: 1
                )
                    .padding(.horizontal, 5)
                Button {
                    distance += 1
                } label: {
                    Image(systemName: "plus")
                }
                    .font(.system(size: 25))
                    .disabled(distance == 150 ? true : false)
                    .foregroundColor(distance == 150 ? .gray : .blue)
            }
                .padding(.horizontal, 60)
            Text("Miles per week:  \(Int(distance))")
                .font(.system(size: 20))
                .padding(.vertical, 10)
            HStack {
                Text("Days per week:  \(Int(daysPerWeek))")
                .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                .font(.system(size: 20))
                Button {
                    daysPerWeek -= 1
                } label: {
                    Image(systemName: "minus")
                }
                    .font(.system(size: 25))
                    .disabled(daysPerWeek == 4 ? true : false)
                    .foregroundColor(daysPerWeek == 4 ? .gray : .blue)
                Button {
                    daysPerWeek += 1
                } label: {
                    Image(systemName: "plus")
                }
                    .font(.system(size: 25))
                    .disabled(daysPerWeek == 7 ? true : false)
                    .foregroundColor(daysPerWeek == 7 ? .gray : .blue)
            }
            HStack {
                Text("Long Run:  \(Int(longRunPercent * 100))%")
                .padding(EdgeInsets(top: 10, leading: 50, bottom: 40, trailing: 50))
                .font(.system(size: 20))
                Button {
                    longRunPercent -= 0.05
                } label: {
                    Image(systemName: "minus")
                }
                    .font(.system(size: 25))
                    .disabled(longRunPercent == 0.2 ? true : false)
                    .foregroundColor(longRunPercent == 0.2 ? .gray : .blue)
                Button {
                    longRunPercent += 0.05
                } label: {
                    Image(systemName: "plus")
                }
                    .font(.system(size: 25))
                    .disabled(longRunPercent == 0.3 ? true : false)
                    .foregroundColor(longRunPercent == 0.3 ? .gray : .blue)
            }
                
            Text(String(format: "Miles per day: %.2f", distance * (1 - longRunPercent) / (daysPerWeek - 1)))
                .font(.system(size: 20))
            Text(String(format: "Long Run: %.2f", distance * longRunPercent))
                .padding(.vertical, 20)
                .font(.system(size: 20))
            Text("Next week mileage: \(Int(round(distance * 1.1)))")
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0))
            NavigationLink(destination: CalculatorView(darkMode: $darkMode)) {
                Text("Pace Calculator")
            }
                .font(.system(size: 23))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                .foregroundColor(.blue)
            NavigationLink(destination: FinishTimeView(darkMode: $darkMode)) {
                Text("Finish Time Calculator")
            }
                .font(.system(size: 23))
                .foregroundColor(.blue)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

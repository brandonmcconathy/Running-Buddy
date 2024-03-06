//
//  HomeView.swift
//  First
//
//  Created by Brandon McConathy on 3/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var distance = 75.0
    @State private var daysPerWeek = 6.0
    
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
                    .disabled(distance == 100 ? true : false)
            }
                .padding(.horizontal, 60)
            Text("Miles per week:  \(Int(distance))")
                .font(.system(size: 20))
                .padding(.vertical, 10)
            Stepper(
                value: $daysPerWeek,
                in: 5...7,
                step: 1
            ) {
                Text("Days per week:  \(Int(daysPerWeek))")
            }
            .padding(EdgeInsets(top: 10, leading: 50, bottom: 40, trailing: 50))
            .font(.system(size: 20))
            Text(String(format: "Miles per day: %.2f", distance * 0.75 / (daysPerWeek - 1)))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                .font(.system(size: 20))
            Text(String(format: "Long Run: %.2f", distance * 0.25))
                .font(.system(size: 20))
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

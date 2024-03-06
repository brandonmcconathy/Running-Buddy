//
//  HomeView.swift
//  First
//
//  Created by Brandon McConathy on 3/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var distance = 50.0
    @State private var daysPerWeek = 5.0
    
    var body: some View {
        VStack {
            Text("Running Schedule")
                .font(.system(size: 28))
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
                    in: 0...100,
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
            .padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: 50))
            .font(.system(size: 20))
            Text("Miles per day: \(distance * 0.75 / (daysPerWeek - 1))")
            Text("Long Run: \(distance * 0.25)")
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

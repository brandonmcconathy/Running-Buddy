//
//  FinishTimeView.swift
//  First
//
//  Created by Brandon McConathy on 3/9/24.
//

import SwiftUI

func totalTime(minutes: Int, seconds: Int, distance: Distance, metric: Bool) -> Double {
    return (Double(minutes) * getMileage(distance: distance) * (metric ? 1.609 : 1.0)) + ((Double(seconds) * getMileage(distance: distance) * (metric ? 1.609 : 1.0)) / 60)
}

func findHours(time: Double) -> Int {
    return Int(time / 60)
}

func findMinutes(time: Double) -> Int {
    return Int(time) - (findHours(time: time) * 60)
}

func findSeconds(time: Double) -> Int {
    return Int((time - Double(findHours(time: time) * 60) - Double(findMinutes(time: time))) * 60)
}

struct FinishTimeView: View {
    
    @Binding var darkMode: Bool
    @Binding var metric: Bool
    
    @State private var selectedDistance: Distance = .full
    @State private var paceMinutes = 0
    @State private var paceSeconds = 0
    
    var body: some View {
        ZStack {
            Color(darkMode ? .gray : .white)
                .ignoresSafeArea()
            VStack {
                Text("Finish Time Calculator")
                    .font(.system(size: 28))
                Picker("Distance", selection: $selectedDistance) {
                    Text("Marathon").tag(Distance.full)
                    Text("Half Marathon").tag(Distance.half)
                    Text("10k").tag(Distance.tenk)
                    Text("5k").tag(Distance.fivek)
                }
                    .pickerStyle(.wheel)
                    .padding(EdgeInsets(top:-20, leading:0, bottom:-10, trailing:0))
                Text(String(format: metric ? "Pace: %d:%02d/km" : "Pace: %d:%02d/mi", paceMinutes, paceSeconds))
                    .font(.system(size: 20))
                    .padding(.vertical, 10)
                HStack {
                    Picker("Minutes", selection: $paceMinutes) {
                        ForEach(0..<31) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                        .pickerStyle(.wheel)
                    Text(":")
                    Picker("Seconds", selection: $paceSeconds) {
                        ForEach(0..<60) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                        .pickerStyle(.wheel)
                }
                .padding(EdgeInsets(top:0, leading:80, bottom:0, trailing:80))

                Text("Finish Time:")
                    .font(.system(size: 24))
                    .padding(.vertical, 15)
                Text(String(format: "%d:%02d:%02d", findHours(time: totalTime(minutes: paceMinutes, seconds: paceSeconds, distance: selectedDistance, metric: metric)), findMinutes(time: totalTime(minutes: paceMinutes, seconds: paceSeconds, distance: selectedDistance, metric: metric)), findSeconds(time: totalTime(minutes: paceMinutes, seconds: paceSeconds, distance: selectedDistance, metric: metric))))
                    .font(.system(size: 24))
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

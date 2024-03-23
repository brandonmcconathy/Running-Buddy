//
//  CalculatorView.swift
//  First
//
//  Created by Brandon McConathy on 3/6/24.
//

import SwiftUI

enum Distance: String, CaseIterable, Identifiable {
    case full, half, tenk, fivek
    var id: Self { self }
}

func getMileage(distance: Distance) -> Double {
    switch distance {
    case .full:
        return 26.2188
    case .half:
        return 13.1064
    case .tenk:
        return 6.2137
    case .fivek:
        return 3.1069
    }
}

func getMinutes(time:Double, distance:Double) -> Int {
    return Int(time / distance)
}

func getSeconds(time:Double, distance:Double) -> Int {
    return Int((time / distance - floor(time / distance)) * 60)
}

func getTime(hours:Int, minutes:Int, seconds:Int) -> Double {
    return Double(hours) * 60 + Double(minutes) + Double(seconds) / 60
}

struct CalculatorView: View {
    
    @Binding var darkMode: Bool
    
    @State private var selectedDistance: Distance = .full
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    var body: some View {
        ZStack {
            Color(darkMode ? .lightGray : .white)
                .ignoresSafeArea()
            VStack {
                Text("Pace Calculator")
                    .font(.system(size: 28))
                Picker("Distance", selection: $selectedDistance) {
                    Text("Marathon").tag(Distance.full)
                    Text("Half Marathon").tag(Distance.half)
                    Text("10k").tag(Distance.tenk)
                    Text("5k").tag(Distance.fivek)
                }
                    .pickerStyle(.wheel)
                    .padding(EdgeInsets(top:-20, leading:0, bottom:-20, trailing:0 ))
                HStack {
                    Picker("Hours", selection: $hours) {
                        ForEach(0..<10) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                        .pickerStyle(.wheel)
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0..<60) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                        .pickerStyle(.wheel)
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0..<60) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                        .pickerStyle(.wheel)
                }
                    .padding(.horizontal, 60)
                Text(String(format: "Finish Time: %d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 20))
                    .padding(.vertical, 10)
                Text(String(format: "Required pace: %d:%02d per mile", getMinutes(time: getTime(hours: hours, minutes: minutes, seconds: seconds), distance: getMileage(distance: selectedDistance)), getSeconds(time: getTime(hours: hours, minutes: minutes, seconds: seconds), distance: getMileage(distance: selectedDistance))))
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    ContentView()
}

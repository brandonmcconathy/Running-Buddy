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

func getTime(hours:Double, minutes:Double, seconds:Double) -> Double {
    return hours * 60 + minutes + seconds / 60
}

struct CalculatorView: View {
    
    @Binding var darkMode: Bool
    
    @State private var selectedDistance: Distance = .full
    @State private var hours = 0.0
    @State private var minutes = 0.0
    @State private var seconds = 0.0
    @State private var time = 225.0
    
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
                        ForEach(0...10, id:\.self) { number in
                            Text("\(number)")
                        }
                    }
                        .pickerStyle(.wheel)
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0...59, id:\.self) { number in
                            Text("\(number)")
                        }
                    }
                        .pickerStyle(.wheel)
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0...59, id:\.self) { number in
                            Text("\(number)")
                        }
                    }
                        .pickerStyle(.wheel)
                }
                    .padding(.horizontal, 60)
                Text("Finish Time:  \(Int(hours)):\(minutes):\(seconds)")
                    .font(.system(size: 20))
                    .padding(.vertical, 10)
                Text(String(format: "Required pace: %d:%02d per mile", Int(time / getMileage(distance: selectedDistance)), Int((time / getMileage(distance: selectedDistance) - floor(time / getMileage(distance: selectedDistance))) * 60)))
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    ContentView()
}

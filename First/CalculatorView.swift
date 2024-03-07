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

struct CalculatorView: View {
    
    @Binding var darkMode: Bool
    
    @State private var selectedDistance: Distance = .full
    @State private var time = 150.0
    
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
                HStack {
                    Button {
                        time -= 1
                    } label: {
                        Image(systemName: "minus")
                    }
                        .font(.system(size: 25))
                        .disabled(time == 0 ? true : false)
                    Slider(
                        value: $time,
                        in: 0...300,
                        step: 1
                    )
                        .padding(.horizontal, 5)
                    Button {
                        time += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                        .font(.system(size: 25))
                        .disabled(time == 300 ? true : false)
                }
                    .padding(.horizontal, 60)
                Text("Finish Time:  \(Int(time))")
                    .font(.system(size: 20))
                    .padding(.vertical, 10)
                Text("\(getMileage(distance: selectedDistance))")
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    ContentView()
}

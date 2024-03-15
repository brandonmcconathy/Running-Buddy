//
//  FinishTimeView.swift
//  First
//
//  Created by Brandon McConathy on 3/9/24.
//

import SwiftUI

struct FinishTimeView: View {
    
    @Binding var darkMode: Bool
    @State private var selectedDistance: Distance = .full
    @State private var paceMinutes = 0
    @State private var paceSeconds = 0
    
    var body: some View {
        ZStack {
            Color(darkMode ? .lightGray : .white)
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
                    .padding(EdgeInsets(top:-20, leading:0, bottom:-20, trailing:0))
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
                Text(String(format: "%d:%02d/mi", paceMinutes, paceSeconds))
                    .font(.system(size: 20))
                    .padding(.vertical, 10)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

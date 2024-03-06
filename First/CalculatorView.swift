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
struct CalculatorView: View {
    
    @Binding var darkMode: Bool
    @State private var selectedDistance: Distance = .full
    
    var body: some View {
        ZStack {
            Color(darkMode ? .lightGray : .white)
                .ignoresSafeArea()
            VStack {
                Text("Pace Calculator")
                    .font(.system(size: 28))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Picker("Distance", selection: $selectedDistance) {
                    Text("Marathon").tag(Distance.full)
                    Text("Half Marathon").tag(Distance.half)
                    Text("10k").tag(Distance.tenk)
                    Text("5k").tag(Distance.fivek)
                }
                .pickerStyle(.wheel)
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    ContentView()
}

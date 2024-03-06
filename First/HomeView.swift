//
//  HomeView.swift
//  First
//
//  Created by Brandon McConathy on 3/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var speed = 50.0
    
    var body: some View {
        VStack {
            Text("Miles per week")
                .font(.system(size: 28))
            HStack {
                Button {
                    speed -= 1
                } label: {
                    Image(systemName: "minus")
                }
                    .font(.system(size: 25))
                    .disabled(speed == 0 ? true : false)
                Slider(
                    value: $speed,
                    in: 0...100,
                    step: 1
                )
                    .padding(.horizontal, 5)
                Button {
                    speed += 1
                } label: {
                    Image(systemName: "plus")
                }
                    .font(.system(size: 25))
                    .disabled(speed == 100 ? true : false)
            }
                .padding(.horizontal, 60)
            Text("\(Int(speed))")
                .font(.system(size: 20))
                .padding(.vertical, 10)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

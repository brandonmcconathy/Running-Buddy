//
//  ContentView.swift
//  First
//
//  Created by Brandon McConathy on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            Color(.lightGray)
                .ignoresSafeArea()
            VStack() {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        
    }
}

#Preview {
    ContentView()
}

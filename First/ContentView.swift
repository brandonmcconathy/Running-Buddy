//
//  ContentView.swift
//  First
//
//  Created by Brandon McConathy on 2/29/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var settings: Bool = false
    @State private var darkMode: Bool = true
    @State private var metric: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(darkMode ? .black : .white)
                    .ignoresSafeArea()
                if settings {
                    SettingsView(darkMode: $darkMode, metric: $metric)
                } else {
                    HomeView(darkMode: $darkMode)
                }
            }
            .foregroundStyle(darkMode ? .white : .black)
            .statusBar(hidden: true)
            .toolbar {
                ToolbarItem() {
                    Button {
                        settings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
         
    }
}

#Preview {
    ContentView()
}

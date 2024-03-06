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
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(darkMode ? .lightGray : .white)
                    .ignoresSafeArea()
                if settings {
                    SettingsView(darkMode: $darkMode)
                } else {
                    HomeView(darkMode: $darkMode)
                }
            }
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

//
//  SettingsView.swift
//  First
//
//  Created by Brandon McConathy on 2/29/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkMode: Bool
    
    var body: some View {
        VStack() {
            Text("Settings")
                .font(.system(size: 25))
            VStack {
                Toggle("Dark Mode", isOn: $darkMode)
                    .padding(.horizontal, 100)

            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

//
//  FinishTimeView.swift
//  First
//
//  Created by Brandon McConathy on 3/9/24.
//

import SwiftUI

struct FinishTimeView: View {
    
    @Binding var darkMode: Bool
    
    var body: some View {
        VStack() {
            Text("Finish Time Calculator")
                .font(.system(size: 25))
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

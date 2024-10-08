//
//  ContentView.swift
//  Bookworm
//
//  Created by Mykola Chaikovskyi on 08.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

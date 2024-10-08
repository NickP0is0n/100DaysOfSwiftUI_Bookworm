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
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

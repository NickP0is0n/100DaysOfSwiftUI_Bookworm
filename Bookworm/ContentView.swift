//
//  ContentView.swift
//  Bookworm
//
//  Created by Mykola Chaikovskyi on 08.10.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Christopher", "David", "Matt", "Peter", "Judie", "Clara", "Amy", "Rose"]
                    let lastNames = ["Ecclestone", "Tennant", "Smith", "Capaldi", "Whittaker"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

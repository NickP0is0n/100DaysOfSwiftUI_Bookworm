//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mykola Chaikovskyi on 09.10.2024.
//

import SwiftUI

extension String {
    func hasContent() -> Bool {
        return !self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var informationCorrect: Bool {
        if title.hasContent() &&
            author.hasContent() &&
            rating >= 1 && rating <= 5 &&
            genres.contains(genre) &&
            review.hasContent() {
            return true
        }
        
        return false
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(!informationCorrect)
            }
            .navigationTitle("Add book")
        }
    }
}

#Preview {
    AddBookView()
}

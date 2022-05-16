//
//  NotesViewModel.swift
//  CRUD
//
//  Created by MAC on 16/05/22.
//

import Foundation

final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteModel] = []
    
    private let userDefaults: UserDefaults = .standard
    
    init() {
        notes = getAllNotes()
    }
    
    func saveNote(description: String) {
        let newNote = NoteModel(description: description)
        notes.insert(newNote, at: 0)
        encodeAndSaveAllNotes()
    }
    
    private func encodeAndSaveAllNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            userDefaults.set(encoded, forKey: "notes")
        }
    }
    
    func getAllNotes() -> [NoteModel] {
        if let notesData = userDefaults.object(forKey: "notes") as? Data {
            if let notes = try? JSONDecoder().decode([NoteModel].self, from: notesData) {
                return notes
            }
        }
        return []
    }
}

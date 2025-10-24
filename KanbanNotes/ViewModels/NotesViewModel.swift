//
//  NotesViewModel.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import Combine
import CoreData
import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [NoteEntity] = []
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchNotes()
    }

    func fetchNotes() {
        let request = NoteEntity.fetchRequest()
        do {
            notes = try context.fetch(request)
        } catch {
            print("Fetch failed:", error)
        }
    }

    func addNote(title: String, details: String = "", status: String = "TO DO") {
        let note = NoteEntity(context: context)
        note.id = UUID()
        note.title = title
        note.details = details
        note.status = status
        save()
    }

    func move(note: NoteEntity, to status: String) {
        note.status = status
        save()
    }

    func delete(note: NoteEntity) {
        context.delete(note)
        save()
    }

    func save() {
        do {
            try context.save()
            fetchNotes()
        } catch {
            print("Save error:", error)
        }
    }
}

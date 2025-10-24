//
//  BoardView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI

struct BoardView: View {
    @StateObject var viewModel: NotesViewModel
    @State private var selectedNote: NoteEntity?
    let statuses = ["TO DO", "DOING", "DONE"]

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ForEach(statuses, id: \.self) { status in
                KanbanColumnView(
                    title: status,
                    notes: viewModel.notes.filter { $0.status == status },
                    onDropNote: { id in
                        if let note = viewModel.notes.first(where: { $0.id == id }) {
                            viewModel.move(note: note, to: status)
                        }
                    },
                    onNoteTapped: { note in
                        selectedNote = note
                    }
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .sheet(item: $selectedNote) { _ in
            NoteEditorView(viewModel: viewModel, note: $selectedNote)
        }
        .padding()
        .toolbar {
            Button("Add Note") {
                viewModel.addNote(title: "New Note")
            }
        }
    }
}

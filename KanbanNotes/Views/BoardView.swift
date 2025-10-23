//
//  BoardView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI

struct BoardView: View {
    @StateObject var viewmodel: NotesViewModel
    let statuses = ["To Do", "Doing", "Done"]
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ForEach(statuses, id: \.self) { status in
                KanbanColumnView(
                    title: status,
                    notes: viewModel.notes.filter($0.status == status),
                    onDropNote: { note in
                        viewModel.move(note: note, to: status)
                    }
                )
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .toolbar{Button("Add Note") {
            viewModel.addNote(title: "New Note")
            }
        }
    }
}

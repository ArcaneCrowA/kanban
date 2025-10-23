//
//  KanbanColumnView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI

struct KanbanColumnView: View {
    let title: String
    let notes: [NoteEntity]
    let onDropNote: (NoteEntity) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.bottom, 8)

            ForEach(notes) { note in
                NoteCardView(note: note)
                    .onDrag { NSItemProvider(object: note.id.uuidString as NSString) }
                    .onDrop(of: [.text], isTargeted: nil) { providers in
                        _ = providers.first?.loadObject(ofClass: NSString.self) { idString, _ in
                            if let id = UUID(uuidString: idString as String?) {
                                DispatchQueue.main.async {
                                    if let draggedNote = notes.first(where: { $0.id == id }) {
                                        onDropNote(draggedNote)
                                    }
                                }
                            }
                        }
                        return true
                    }
            }
            Spacer()
        }
        .padding()
        .background(Color(NSColor.windowBackgroundColor))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

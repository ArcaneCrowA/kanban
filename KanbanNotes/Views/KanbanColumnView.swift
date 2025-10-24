//
//  KanbanColumnView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct KanbanColumnView: View {

    let title: String

    let notes: [NoteEntity]

    let onDropNote: (UUID) -> Void

    var body: some View {

        VStack(alignment: .leading) {

            Text(title)

                .font(.title2)

                .bold()

                .padding(.bottom, 8)

            ForEach(notes) { note in

                NoteCardView(note: note)

                    .onDrag { NSItemProvider(object: note.id.uuidString as NSString) }

            }

            Spacer()

        }

        .onDrop(of: [.text], isTargeted: nil) { providers in

            _ = providers.first?.loadObject(ofClass: NSString.self) { idString, _ in

                if let idString = idString as? String, let id = UUID(uuidString: idString) {

                    DispatchQueue.main.async {

                        onDropNote(id)

                    }

                }

            }

            return true

        }
        .padding()
        .background(Color(NSColor.windowBackgroundColor))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

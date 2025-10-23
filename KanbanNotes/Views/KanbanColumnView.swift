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
                    .onDrag{Ns}
            }
        }
    }
}

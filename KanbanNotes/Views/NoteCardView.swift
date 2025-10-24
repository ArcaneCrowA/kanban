//
//  NoteCardView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI

struct NoteCardView: View {
    @ObservedObject var note: NoteEntity
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
                .lineLimit(1)
            if !(note.details).isEmpty {
                Text(note.details)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 100)
        .onTapGesture { onTap() }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .shadow(radius: 1)
        .padding(.bottom, 4)
    }
}

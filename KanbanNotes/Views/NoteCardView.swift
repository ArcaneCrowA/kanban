//
//  NoteCardView.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI

struct NoteCardView: View {
    @ObservedObject var note: NoteEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
            if !note.details.isEmpty {
                Text(note.details)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .shadow(radius: 1)
        .padding(.bottom, 4)
    }
}

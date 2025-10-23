//
//  KanbanNotesApp.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import SwiftUI
import CoreData

@main
struct KanbanNotesApp: App {
    let persistenceController = PersistenceController.shared

        var body: some Scene {
            WindowGroup {
                BoardView(viewModel: NotesViewModel(context: persistenceController.container.viewContext))
                    .frame(minWidth: 900, minHeight: 500)
            }
        }
    }
}

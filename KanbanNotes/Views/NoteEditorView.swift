import SwiftUI

struct NoteEditorView: View {
    @ObservedObject var viewModel: NotesViewModel
    @Binding var note: NoteEntity?
    @State private var title: String = ""
    @State private var details: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("", text: $title)
                }
                Section(header: Text("Details")) {
                    TextField("", text: $details)
                }
            }
            .navigationTitle("Edit Note")
            .onAppear {
                if let note = note {
                    title = note.title
                    details = note.details ?? ""
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let noteToSave = note {
                            noteToSave.title = title
                            noteToSave.details = details
                            viewModel.save()
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

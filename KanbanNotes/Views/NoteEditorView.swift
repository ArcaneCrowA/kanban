import SwiftUI

struct NoteEditorView: View {
    @ObservedObject var viewModel: NotesViewModel
    @Binding var note: NoteEntity?
    @State private var title: String = ""
    @State private var details: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                TextEditor(text: $details)
                    .font(.body)
                    .padding()
                    .border(Color.gray.opacity(0.2), width: 1)

                Spacer()
            }
            .padding()
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
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        if let noteToDelete = note {
                            viewModel.delete(note: noteToDelete)
                        }
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "trash")
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

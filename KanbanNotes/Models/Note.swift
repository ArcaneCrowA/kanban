//
//  Note.swift
//  KanbanNotes
//
//  Created by Adilet Beishekeyev on 23.10.2025.
//

import Foundation
import CoreData

@objc(NoteEntity)
public class NoteEntity: NSManagedObject {}

extension NoteEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var details: String
    @NSManaged public var status: String
}

extension NoteEntity: Identifiable {}

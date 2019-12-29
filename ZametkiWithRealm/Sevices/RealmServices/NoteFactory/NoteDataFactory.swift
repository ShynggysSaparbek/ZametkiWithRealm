//
//  NoteFactory.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/25/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
class NoteDataFactory: NoteFactory{
    func createNote(noteObject: NoteDataObjectWithRealm) throws -> NoteRepresentation {
        guard let idString = noteObject.id else {
            throw NoteByRealmError.CanNotCreateNoteModelWithoutID
        }
            guard let id = UUID(uuidString: idString) else {
            throw NoteByRealmError.CanNotConvertStringToUUID
        }

        guard let title = noteObject.title else {
            throw NoteByRealmError.CanNotCreateNoteModelWithoutTitle
        }
        
        guard let text = noteObject.text  else {
            throw NoteByRealmError.CanNoteCreateNoteModelWithoutText
        }
        
        guard let lastEdited = noteObject.lastEdited else {
            throw NoteByRealmError.CanNoteCreateNoteModelWithoutText
        }
        let noteData = NoteData(id: id, title: title, text: text, lastEdited: lastEdited)
        return noteData
    }
    
    
}

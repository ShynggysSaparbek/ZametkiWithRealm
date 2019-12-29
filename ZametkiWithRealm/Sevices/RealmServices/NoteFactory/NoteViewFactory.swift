//
//  NoteViewFactory.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/25/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
class NoteViewFactory: NoteFactory{
    func createNote(noteObject: NoteDataObjectWithRealm) throws  -> NoteRepresentation {
        guard let title = noteObject.title else {
            throw NoteByRealmError.CanNotCreateNoteModelWithoutTitle
        }
        
        guard let idString = noteObject.id else {
            throw NoteByRealmError.CanNotCreateNoteModelWithoutID
        }
        
        guard let id = UUID(uuidString: idString) else {
            throw NoteByRealmError.CanNotConvertStringToUUID
        }
        
        guard let lastEdited = noteObject.lastEdited else {
            throw NoteByRealmError.CanNoteCreateNoteModelWithoutText
        }
        
        let noteView = NoteViewModel(id: id, title: title, lastEdited: lastEdited)
        
        return  noteView
    }
    
    
}

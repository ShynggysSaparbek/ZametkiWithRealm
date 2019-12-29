//
//  NoteListViewModel.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
struct NoteViewModel: Identifiable, NoteRepresentation{
    var id: UUID
    var title: String
    var lastEdited: Date
    
    init(id: UUID, title: String, lastEdited: Date){
        self.id = id
        self.title = title
        self.lastEdited = lastEdited
    }
    
    init(noteData: NoteData){
        self.id = noteData.id
        self.title = noteData.title
        self.lastEdited = noteData.lastEdited
    }
}

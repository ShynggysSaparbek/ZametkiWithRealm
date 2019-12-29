//
//  NoteDataModel.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
struct NoteData: Identifiable, NoteRepresentation{
    var id: UUID
    var title: String
    var text: String
    var lastEdited: Date
    
    
    init(title: String, text: String, lastEdited: Date){
        self.id = UUID()
        self.title = title
        self.text = text
        self.lastEdited = Date()
    }
    
    init(id: UUID, title: String, text: String, lastEdited: Date){
        self.id = id
        self.title = title
        self.text = text
        self.lastEdited = lastEdited
    }
    
}

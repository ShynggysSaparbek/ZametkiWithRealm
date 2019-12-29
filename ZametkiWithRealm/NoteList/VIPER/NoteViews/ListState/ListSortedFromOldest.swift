//
//  ListSortedByDate.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/28/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
class ListSortedFromOldest: NoteListStateProtocol {
    var text: String {
        get {
            return "Старейшие"
        }
    }
    
    var presentedNotes: [NoteViewModel] 
    
    init(availableNotes: [NoteViewModel]){
        self.presentedNotes = availableNotes.sorted(by: { (firstNote, secondNote) -> Bool in
            return firstNote.lastEdited < secondNote.lastEdited
        })
    }
}
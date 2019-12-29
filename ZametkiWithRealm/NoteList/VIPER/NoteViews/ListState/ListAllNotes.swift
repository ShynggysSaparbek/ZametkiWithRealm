//
//  ListAllNotes.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/28/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
class ListAllNotes: NoteListStateProtocol {
    var text: String {
        get {
            return "Результат"
        }
    }
    
    var presentedNotes: [NoteViewModel]
    
    init(availableNotes: [NoteViewModel]){
        self.presentedNotes = availableNotes
    }
}

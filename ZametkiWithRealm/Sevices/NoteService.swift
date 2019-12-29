//
//  NoteService.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/25/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
protocol NoteService{
    func getAllNotesViewModels() -> [NoteViewModel]
    func getNote(with id: UUID) -> NoteData?
    func editNote(with id: UUID, title: String, text: String) throws
    func addNote(with title: String, and text: String) throws
    func deleteNote(with id: UUID) throws
}

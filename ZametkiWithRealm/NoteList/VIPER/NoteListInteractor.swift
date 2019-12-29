//
//  NoteListInteractor.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
protocol NoteListInteractorProtocol{
    func getNoteViews() -> [NoteViewModel]
    func getNote(by id: UUID) -> NoteData?
    func addNote(with title: String, and text: String) throws
    func editNote(with id: UUID, title: String, text:String) throws
    func deleteNote(with id: UUID) throws
}
class NoteListInteractor: NoteListInteractorProtocol{
    private var dependencies: NoteListDependenciesProtocol
    private var service: NoteService
    
    init(dependencies: NoteListDependenciesProtocol, service: NoteService){
        self.dependencies = NoteListDependencies()
        self.service = service
    }
    func getNoteViews() -> [NoteViewModel]{
        return service.getAllNotesViewModels()
    }
    
    func getNote(by id: UUID) -> NoteData? {
        return service.getNote(with: id)
    }
    
    func addNote(with title: String, and text: String) throws {
        do{
            try service.addNote(with: title, and: text)
        }catch{
            throw error
        }
    }
    
    func editNote(with id: UUID, title: String, text:String) throws{
        try service.editNote(with: id, title: title, text: text)
        
    }
    
    func deleteNote(with id: UUID) throws {
        try service.deleteNote(with: id)
    }
}

//
//  NoteListPresenter.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
protocol NoteListPresenterProtocol: class{
    var availableNoteViewModels: [NoteViewModel] {get set}
    func addNote(with title: String, and text: String)  throws
    func getNote(with id: UUID) -> NoteData?
    func editNote(with id: UUID, title: String, text: String) throws
    func deleteNote(with id: UUID) throws
    func updateAvailableNotes()
    func changeState(state: NoteListStateProtocol)
}
class NoteListPresenter: ObservableObject, NoteListPresenterProtocol{
    private var interactor: NoteListInteractorProtocol
    private var view: NoteListView
    private var listState: NoteListStateProtocol
    
    var availableNoteViewModels: [NoteViewModel] = []
    
    init(interactor: NoteListInteractorProtocol, view: NoteListView){
        self.interactor = interactor
        
        self.view = view
        
        availableNoteViewModels = interactor.getNoteViews()
        listState =  ListAllNotes(availableNotes: availableNoteViewModels)
    }
    
    func addNote(with title: String, and text: String)  throws {
        try interactor.addNote(with: title, and: text)
        
        updateAvailableNotes()
        
        changeState(state: ListAllNotes(availableNotes: availableNoteViewModels))
    }
    
    func getNote(with id: UUID) -> NoteData? {
        return interactor.getNote(by: id)
    }
    
    func editNote(with id: UUID, title: String, text: String) throws {
        try interactor.editNote(with: id, title: title, text: text)
        
        updateAvailableNotes()
        
        changeState(state: ListAllNotes(availableNotes: availableNoteViewModels))
    }
    
    func updateAvailableNotes(){
        availableNoteViewModels = interactor.getNoteViews()
    }
    
    func deleteNote(with id: UUID) throws {
        try interactor.deleteNote(with: id)
    }
    
    func changeState(state: NoteListStateProtocol){
        listState = state
        view.stateButton.title = listState.text
        view.presentedNotes = listState.presentedNotes
        view.tableView.reloadData()
    }
}


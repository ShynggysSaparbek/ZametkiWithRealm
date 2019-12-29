//
//  NotesService.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
import RealmSwift
class NotesByRealmService: NoteService {
    private var realm: Realm
    private var noteFactory: NoteFactory! 
    
    init(){
        realm = try! Realm()
    }
    
    /*
    func getAllNoteData() -> [NoteDataModel] {
        let noteObjects = realm.objects(NoteDataObject.self)
        var notes: [NoteDataModel] = []
        
        noteFactory =  NoteDataFactory()
        
        for noteObject in noteObjects{
            do{
                let note: NoteDataModel = try noteFactory.createNote(noteObject: noteObject) as! NoteDataModel
                notes.append(note)
            }catch{
                print(error.localizedDescription)
            }
        }
        return notes
    }
    */
    func getAllNotesViewModels() -> [NoteViewModel] {
        let noteObjects = realm.objects(NoteDataObjectWithRealm.self)
        var notes: [NoteViewModel] = []
        
        noteFactory =  NoteViewFactory()
        
        for noteObject in noteObjects{
            do{
                let note = try noteFactory.createNote(noteObject: noteObject)
                guard let noteView = note as?  NoteViewModel else {
                    throw NoteByRealmError.CanNotDowncastFromNoteRepresentation
                }
                notes.append(noteView)
            }catch{
                print(error.localizedDescription)
            }
        }
        return notes
    }

    func getNote(with id: UUID) -> NoteData? {
        noteFactory = NoteDataFactory()
        var note: NoteData?
        
        do{
            let noteObject = try getNoteObject(with: id)
            note = try noteFactory.createNote(noteObject: noteObject) as? NoteData
        }catch{
            print(error.localizedDescription)
        }
        return note
    }
    
    func addNote(with title: String, and text: String) throws {
        let note = NoteDataObjectWithRealm()
        note.title = title
        note.text = text
        note.id = UUID().uuidString
        note.lastEdited =  Date()
        do{
            try realm.write {
                realm.add(note)
            }
        }catch{
            throw NoteByRealmError.NoteCanNoteBeSaved
        }
    }
    
    func editNote(with id: UUID, title: String, text: String) throws {
        do{
            let note = try getNoteObject(with: id)
            try realm.write {
                note.title = title
                note.text = text
                note.lastEdited = Date()
            }
            
        }catch NoteByRealmError.CanNotFindNoteWithId{
            throw NoteByRealmError.CanNotFindNoteWithId
        }catch{
            throw NoteByRealmError.NoteCanNoteBeSaved
        }
    }
    
    func deleteNote(with id: UUID) throws {
        let note = try getNoteObject(with: id)
        
        do{
            try realm.write {
                realm.delete(note)
            }
        }catch{
            throw NoteByRealmError.CanNotDeleteNoteDataObject
        }
    }
    
    private func getNoteObject(with id: UUID) throws -> NoteDataObjectWithRealm{
        let idString =  id.uuidString
        guard let note = realm.objects(NoteDataObjectWithRealm.self).filter("id == %@", idString).first else {
            throw NoteByRealmError.CanNotFindNoteWithId
        }
        return note
    }
}

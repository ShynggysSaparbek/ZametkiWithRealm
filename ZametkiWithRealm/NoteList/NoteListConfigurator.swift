//
//  NoteListConfigurator.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/24/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
protocol NoteListWireFrameProtocol {
    static func createPresenter(view: NoteListView) -> NoteListPresenter
}
class NoteListWireFrame: NoteListWireFrameProtocol {
    static func createPresenter(view: NoteListView) -> NoteListPresenter {
        let dependencies = NoteListDependencies()
        let service = NotesByRealmService()
        
        let interactor: NoteListInteractorProtocol = NoteListInteractor(dependencies: dependencies, service: service)
        return NoteListPresenter(interactor: interactor, view: view)
    }
}

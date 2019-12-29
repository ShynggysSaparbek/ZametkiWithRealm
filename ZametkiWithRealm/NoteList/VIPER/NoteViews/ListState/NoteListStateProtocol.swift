//
//  ListState.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/28/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
protocol NoteListStateProtocol {
    var text: String {get}
    var presentedNotes: [NoteViewModel] {get set}
}

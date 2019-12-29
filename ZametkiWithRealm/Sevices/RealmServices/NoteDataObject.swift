//
//  NoteDataObject.swift
//  ViperNotesWithRealm
//
//  Created by w2 on 12/25/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import Foundation
import RealmSwift
class NoteDataObjectWithRealm: Object{
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    @objc dynamic var text: String?
    @objc dynamic var lastEdited: Date?
}

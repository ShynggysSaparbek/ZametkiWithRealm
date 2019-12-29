//
//  AddNoteView.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/27/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import UIKit

class AddNoteView: UIViewController {
    var presenter: NoteListPresenterProtocol!
    var noteData: NoteData = NoteData(title: "", text: "", lastEdited: Date())
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard let title  = titleField.text, title != "" else {
            return
        }
        guard let text = textView.text, text != "" else {
            return
        }
        do{
            try presenter.addNote(with: title, and: text)
            self.titleField.text = ""
            self.textView.text =  ""
        }catch{
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

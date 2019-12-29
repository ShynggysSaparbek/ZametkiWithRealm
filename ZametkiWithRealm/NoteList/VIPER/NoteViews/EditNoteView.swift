//
//  EditNoteView.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/27/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import UIKit

class EditNoteView: UIViewController {
    var presenter: NoteListPresenterProtocol!
    var note: NoteData!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = note.title
        textView.text = note.text
        // Do any additional setup after loading the view.
    }
    @IBAction func updateButton(_ sender: UIButton) {
        guard let title  = titleField.text, title != "" else {
            return
        }
        guard let text = textView.text else {
            return
        }
        
        do{
            try presenter.editNote(with: note.id, title: title, text: text)
        }catch{
            print(error.localizedDescription)
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

//
//  NoteListView.swift
//  ZametkiWithRealm
//
//  Created by w2 on 12/27/19.
//  Copyright © 2019 ShynCorp. All rights reserved.
//

import UIKit

class NoteListView: UITableViewController {
    var presenter: NoteListPresenterProtocol!
    var presentedNotes: [NoteViewModel]!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var stateButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NoteListWireframe.createPresenter(view: self)
        presenter.changeState(state: ListAllNotes(availableNotes: presenter.availableNoteViewModels))
    }

 

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    @IBAction func enterPressed(_ sender: UITextField) {
        guard let searchText = self.searchTextfield.text, searchText != "" else {
            presenter.changeState(state: ListAllNotes(availableNotes: presenter.availableNoteViewModels))
            return
        }
        presenter.changeState(state: ListOfSearchedNotes(availableNotes: presenter.availableNoteViewModels,
                                                         searchText: searchText))
    }
    
    @IBAction func stateButtonPressed(_ sender: UIBarButtonItem) {
        if stateButton.title == "Последние"{
            
            let listSortedFromOldest = ListSortedFromOldest(availableNotes: presenter.availableNoteViewModels)
            presenter.changeState(state: listSortedFromOldest)
        }else{
            let listSortedFromNewest = ListSortedFromNewest(availableNotes: presenter.availableNoteViewModels)
            presenter.changeState(state: listSortedFromNewest)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presentedNotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let model = presentedNotes[indexPath.row]
        cell.textLabel?.text = model.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteViewModel = presentedNotes[indexPath.row]
        let note = presenter.getNote(with: noteViewModel.id)
        performSegue(withIdentifier: "editNote", sender: note)
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteViewModel = presenter.availableNoteViewModels[indexPath.row]
            do {
                try presenter.deleteNote(with: noteViewModel.id)
                presenter.availableNoteViewModels.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }catch{
                print("Error: Can not Delete. Localized description: \(error.localizedDescription)")
            }
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNote"{
            let view = segue.destination as! AddNoteView
            view.presenter = presenter
        }else if segue.identifier == "editNote"{
            let note = sender as! NoteData
            let view = segue.destination as! EditNoteView
            view.presenter = presenter
            view.note = note
        }
    }
    

}

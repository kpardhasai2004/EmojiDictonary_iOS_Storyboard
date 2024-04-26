//
//  AddEditEmojiTableViewController.swift
//  EmojiDictonary
//
//  Created by user2 on 23/01/24.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    @IBOutlet weak var symbolTextFeild: UITextField!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var descriptionTextFeild: UITextField!
    @IBOutlet weak var usageTextFeild: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var emoji:Emoji?
    
    init?(coder:NSCoder,emoji:Emoji?){
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let emoji = emoji {
            symbolTextFeild.text = emoji.symbol
            nameTextFeild.text = emoji.name
            descriptionTextFeild.text = emoji.description
            usageTextFeild.text = emoji.usage
            title = "Edit Emoji"
        } else {
            
            title = "Add Emoji"
        }
        updateSaveButtonState()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func updateSaveButtonState(){
        let symbolText = symbolTextFeild.text ?? ""
        let nameText = nameTextFeild.text ?? ""
        let descriptionText = descriptionTextFeild.text ?? ""
        let usageText = usageTextFeild.text ?? ""
        saveButton.isEnabled = containsSingleEmoji(_textFeild: symbolTextFeild) && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    @IBAction func textEditigCanged(_sender: UITextField ) {
        updateSaveButtonState()
    }
    
    func containsSingleEmoji(_textFeild: UITextField)->Bool{
        guard let text = _textFeild.text,
              text.count == 1 else {
            return false
        }
        
        let isCombinedIntoEmoji = text.unicodeScalars.count > 1 && text.unicodeScalars.first?.properties.isEmoji ?? false
        let isEmojiPersentation = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        
        return isEmojiPersentation || isCombinedIntoEmoji
    }// validition part
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else {return}
        let symbol = symbolTextFeild.text!
        let name = nameTextFeild.text ?? ""
        let description = descriptionTextFeild.text ?? ""
        let usage = usageTextFeild.text ?? ""
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

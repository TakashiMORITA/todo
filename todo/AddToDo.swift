//
//  AddToDo.swift
//  todo
//
//  Created by MORITA TAKASHI on 2018/05/15.
//  Copyright © 2018年 MORITA TAKASHI. All rights reserved.
//

import UIKit

var todoItem = [String]()

class AddToDo: UITableViewCell {
    
    @IBOutlet weak var itemText: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        todoItem.append(itemText.text!)
        itemText.text = ""
        UserDefaults.standard.set(todoItem, forKey: "todoList")
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemText.resignFirstResponder()
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

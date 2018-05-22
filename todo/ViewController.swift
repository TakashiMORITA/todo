//
//  ViewController.swift
//  todo
//
//  Created by MORITA TAKASHI on 2018/05/11.
//  Copyright © 2018年 MORITA TAKASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        if UserDefaults.standard.object(forKey: "todoList") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todoList") as! [String]
        }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    @IBOutlet weak var todolistTable: UITableView!
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TodoListItem")
        cellValue .textLabel?.text = todoItem[indexPath.row] as? String
        return cellValue
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: indexPath.row)
            UserDefaults.standard.set(todoTime, forKey: "todoList")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }
    
}


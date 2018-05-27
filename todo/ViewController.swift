//
//  ViewController.swift
//  todo
//
//  Created by MORITA TAKASHI on 2018/05/11.
//  Copyright © 2018年 MORITA TAKASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["Private", "Work"]
    //section の個数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mySections.count
    }
    //sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        if UserDefaults.standard.object(forKey: "todoListPrivate") != nil {
            todoItemPrivate = UserDefaults.standard.object(forKey: "todoListPrivate") as! [String]
        }
        if UserDefaults.standard.object(forKey: "todoListWork") != nil {
            todoItemWork = UserDefaults.standard.object(forKey: "todoListWork") as! [String]
        }
        }
    
    //cellの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todoItemPrivate.count
        } else if section == 1 {
            return todoItemWork.count
        } else {
            return 0
        }
    }
    
    
    @IBOutlet weak var todolistTable: UITableView!
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TodoListItem")
        cellValue .textLabel?.text = todoItemPrivate[indexPath.row] as? String
        return cellValue
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItemPrivate.remove(at: indexPath.row)
            UserDefaults.standard.set(todoItemPrivate, forKey: "todoListPrivate")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }
    
}


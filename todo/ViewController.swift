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

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TodoListItem")
        cellValue .textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }

}


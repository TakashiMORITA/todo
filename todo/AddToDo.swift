//
//  AddToDo.swift
//  todo
//
//  Created by MORITA TAKASHI on 2018/05/16.
//  Copyright © 2018年 MORITA TAKASHI. All rights reserved.
//

import UIKit
var todoItem = [Any]()
var todoTime = [Any]()

class AddToDo: UIViewController {

    @IBOutlet weak var itemText: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if(itemText.text != ""){
        todoItem.append(itemText.text!)
        todoTime.append("\(datePicker.date)")
        itemText.text = ""
        UserDefaults.standard.set(todoItem, forKey: "todoList")
        
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

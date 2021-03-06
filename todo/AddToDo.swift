//
//  AddToDo.swift
//  todo
//
//  Created by MORITA TAKASHI on 2018/05/16.
//  Copyright © 2018年 MORITA TAKASHI. All rights reserved.
//

import UIKit

//private用の配列
var todoItemPrivate = [Any]()
//Work用の配列
var todoItemWork = [Any]()

var todoItem = [Any]()
var todoTime = [Any]()

class AddToDo: UIViewController {
    
    //締め切り用テキストフィールド
    @IBOutlet weak var timeText: UITextField!
    var toolBar:UIToolbar!
    
    //タスク用テキストフィールド
    @IBOutlet weak var itemText: UITextField!
    
    //datePickerで締め切りが選択できるようにする
    @IBAction func timeTextField(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    //datepickerが選択されたらtextfieldにe表示
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "MM/dd";
        timeText.text = dateFormatter.string(from: sender.date)
    }
    
    //toolbarのdoneボタン
    @objc func doneBtn(){
        timeText.resignFirstResponder()
    }
    
//    @IBAction func addItem(_ sender: UIBarButtonItem) {
//        if(itemText.text != ""){
//        todoItem.append(itemText.text!)
//        itemText.text = ""
//        UserDefaults.standard.set(todoItem, forKey: "todoList")
//        }
//    }
    
    //tagごとに別の配列に保存する
    @IBAction func addItem(_ sender: UIBarButtonItem){
        if(itemText.text != "")&&(timeText.text != ""){
            if(taskCategory == "Private"){
                todoItemPrivate.append(itemText.text!)
                UserDefaults.standard.set(todoItemPrivate, forKey: "todoListPrivate")
            }else {
                todoItemWork.append(itemText.text!)
                UserDefaults.standard.set(todoItemWork, forKey: "todoListWork")
            }
            itemText.text = ""
            timeText.text = ""
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //datepicker上のtoolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(doneBtn))
        toolBar.items = [toolBarBtn]
        timeText.inputAccessoryView = toolBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tag管理用
    var taskCategory = "Private"
    
    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            taskCategory = "Private"
        case 1:
            taskCategory = "Work"
        default:
            taskCategory = "Private"
        }
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

//
//  TaskWriteViewController.swift
//  ToDo
//
//  Created by 小西星七 on 2021/02/15.
//

import UIKit

class TaskWriteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var taskwriteTextField: UITextField!
    
    
    var datePicker: UIDatePicker!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    //各タスク配列を管理する全体の配列を宣言
    var taskArray: Array<Any>!
    
    //各タスクを入れる配列を宣言
    var titleDaysArray: Array<Any>!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        taskwriteTextField.delegate = self
        
        //もし編集モードであれば押したセルの内容をテキストフィールド&DataPickerに反映させる

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        
        //title配列にテキストフィールドの中身をappend
        titleDaysArray[0] = taskwriteTextField.text
        
        //days配列に日付をappend
        titleDaysArray[1] = datePicker.date
        
        //今回の配列を管理配列にappend
        taskArray.append(titleDaysArray)
        
        //ユーザーデフォルトに保存
        saveData.setValue(titleDaysArray, forKey: "small")
        saveData.setValue(taskArray, forKey: "big")
        
        
        //画面遷移
        performSegueToResult()
        
    }
    
    @IBAction func cancel() {
        
        //画面遷移
        performSegueToResult()
        
    }
    
    func performSegueToResult(){
           
        //配列の情報を渡す
        
        //画面遷移
           performSegue(withIdentifier: "buck", sender: nil)
           
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

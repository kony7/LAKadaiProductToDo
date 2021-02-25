//
//  TaskWriteViewController.swift
//  ToDo
//
//  Created by 小西星七 on 2021/02/15.
//

import UIKit

class TaskWriteViewController: UIViewController, UITextFieldDelegate {

    //テキストフィールドの宣言
    @IBOutlet var taskwriteTextField: UITextField!
    
    //DatePickerの宣言
    var datePicker: UIDatePicker!
    
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //各タスク配列を管理する全体の配列を宣言
    var taskArray: [[String]]!
    
    //各タスクを入れる配列を宣言
    var titleDaysArray:[String]!
    
    //編集モードの場合、配列要素を指定する番号を入れる変数を宣言
    var index: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        taskwriteTextField.delegate = self
        
        //もし編集モードであれば押したセルの内容をテキストフィールド&DataPickerに反映させる
        if index >= 1{
            
            //テキストフィールドに表示
            
            //DatePickerに初期値を表す
            
        }else{
            
            return
            
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        
        //title配列にテキストフィールドの中身をappend
        titleDaysArray.append(taskwriteTextField.text!)
        
        //days配列に日付をappend
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy/mm/dd"
        
        let dateString = dateFomatter.string(from: Date())
        titleDaysArray.append(dateString)
        
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

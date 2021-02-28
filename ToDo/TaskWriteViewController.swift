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
    @IBOutlet var datePicker: UIDatePicker!
    
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //各タスク配列を管理する全体の配列を宣言
    var taskArray: [[String]] = []
    
    //各タスクを入れる配列を宣言
    var titleDaysArray:[String] = []
    
    //編集モードの場合、配列要素を指定する番号を入れる変数を宣言
    var index: Int = -1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        taskwriteTextField.delegate = self
        
     
        //もし編集モードであれば押したセルの内容をテキストフィールド&DataPickerに反映させる
        print(index)
        print("がviewDidLoad時点のindex")
        
        if saveData.array(forKey:"big") == nil{
            
        }else{
            taskArray = saveData.array(forKey: "big") as! [[String]]
        }
        
        if index >= 0{
            //テキストフィールドに表示
            taskwriteTextField.text = taskArray[index][0]

            //DatePickerに初期値を表す
            let firstDate:String = taskArray[index][1]
            let dateFomatter = DateFormatter()
            dateFomatter.dateFormat = "yyyy/MM/dd/HH:mm"
            let datedate = dateFomatter.date(from:firstDate)
            if let nonOptionalDateDate = datedate{
            datePicker.date = nonOptionalDateDate
            }

        }else{
            index = -1
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        
        //title配列にテキストフィールドの中身をappend
        let taskWriteTextFieldContent: String? = taskwriteTextField.text
        if taskWriteTextFieldContent == ""{
            let alert: UIAlertController = UIAlertController(title: "タスクが何かわかりません", message: "タイトルを入れてから保存してください", preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler:{
                  // ボタンが押された時の処理を書く（クロージャ実装）
                  (action: UIAlertAction!) -> Void in
                  print("Cancel")
              })
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
        else if let nonOptionalCheck = taskWriteTextFieldContent{
            
            titleDaysArray.append(nonOptionalCheck)
            
        }
        
        //days配列に日付をappend
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy/MM/dd/HH:mm"
        let dateDate = datePicker.date
        let dateString = dateFomatter.string(from: dateDate)
        //日付をtitleDaysArrayにappend
        titleDaysArray.append(dateString)
        
        print(index)
        print("条件分岐前のindexはこちら")
        
        if index >= 0 {
            
        taskArray[index] = titleDaysArray
            
        }else{
            
        //今回の配列を管理配列にappend
        taskArray.append(titleDaysArray)
        print(taskArray)
            
        }
        
        //ユーザーデフォルトに保存
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "buck"{
          
          //画面遷移を変数に入れる
            let viewController = segue.destination as! ViewController
          
          //遷移先のsaveDataにこっちのsavedateを代入する
              viewController.saveData = self.saveData
        }
        
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

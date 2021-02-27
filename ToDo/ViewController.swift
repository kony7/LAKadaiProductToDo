//
//  ViewController.swift
//  ToDo
//
//  Created by 小西星七 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //TableViewを宣言
    @IBOutlet var table: UITableView!

    //この画面で使う各配列を宣言
    var theIndex: Int? = nil

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        
    }
    
    //テーブルビューの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セル数の指定
        let taskArray = saveData.array(forKey: "big")
        if let nonOptionalTaskArray = taskArray{
            
            return  nonOptionalTaskArray.count
            
        }else{
            
            return 0
            
        }
           
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //"Cell"というIDのセルを取得
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        //セル内の1番タグをつけたパーツにアクセス
        let view1 = cell?.contentView.viewWithTag(1) as! UILabel
        let view2 = cell?.contentView.viewWithTag(2) as! UILabel
//        let titleDaysArray = saveData.array(forKey: "small")
        
        let taskArray = saveData.array(forKey: "big") as! [[String]]
            //taskArrayの中から2要素はいてる配列を取り出し、その中の要素0と要素1をラベルに貼りたい
            let serialNumber:Int! = indexPath.row
                    
                   view1.text = taskArray[serialNumber][0]
                    view2.text = taskArray[serialNumber][1]
       
        //このreturnの意味は？→関数自体が「どんなセル？」と聞いているのに対して、こんなセル！と返す意味のreturn
        return cell!
           
       }
    
    //ボタンが押されたら画面遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        theIndex = indexPath.row
        
        
    }
    
    //画面遷移をするときにTaskWriteViewControllerに編集用の情報を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if segue.identifier == "toTaskWrite"{
            
            //画面遷移を変数に入れる
              let taskWriteViewController = segue.destination as! TaskWriteViewController
            
            //遷移先のindexにtheIndexを代入する
            if theIndex == nil{
                
                return

            }else{
            
                taskWriteViewController.index = self.theIndex!
            
            }
          }
      }
    
    @IBAction func plus(){
        
        performSegue(withIdentifier: "toTaskWrite", sender: nil)
        
    }
    
    //削除機能
    
    
    //並べ替え機能

}


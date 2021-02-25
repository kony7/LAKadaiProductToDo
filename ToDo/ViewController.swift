//
//  ViewController.swift
//  ToDo
//
//  Created by 小西星七 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //TableViewを宣言
    @IBOutlet var table: UITableView!

    //この画面で使う各配列を宣言
    var taskArray: [[String]]!
    var titleDaysArray: [String]!
    var theIndex: Int!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        //配列にUserDefaultから内容を代入
        
        
    }
    
    //テーブルビューの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セル数の指定
           return  taskArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //"Cell"というIDのセルを取得
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        //セル内の1番タグをつけたパーツにアクセス
        let view = cell?.contentView.viewWithTag(1) as! UILabel
        view.text = titleDaysArray[indexPath.row]
        
           
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
            taskWriteViewController.index = self.theIndex
          
          }
      }
    
    //削除機能
    
    
    //並べ替え機能

}


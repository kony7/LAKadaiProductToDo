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

    //TaskWriteViewControllerから情報を受け取るための配列を宣言
    var taskArray: Array<Any>!
    var titleDaysArray: Array<Any>!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        
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
        let view = cell?.contentView.viewWithTag(1)
            
//        view.text = titleDaysArray[indexPath.row] as! String
           
        return cell!
        
           
       }
    
    //削除機能
    
    //編集機能
    
    //並べ替え機能

}


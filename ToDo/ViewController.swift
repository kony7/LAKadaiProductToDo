//
//  ViewController.swift
//  ToDo
//
//  Created by 小西星七 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {

    let cellIdentifier = "UITableViewCell"
    
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //TableViewを宣言
    @IBOutlet var table: UITableView!
    
    //serchBarを宣言
    @IBOutlet var search: UISearchBar!

    //この画面で使う各配列や変数を宣言
     //選択したセル情報をTaskWriteViewControllerに渡す変数
    var theIndex: Int? = nil
     //saveDataからtaskArrayを入れる配列
    var taskArray:[[String]] = []
     //サーチバーを使うときに検索されたタスクのタイトルだけを代入する配列
    var searchedTaskArray:[[String]] = []
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.delegate = self
        
        //デリゲート先を自分に設定する。
        search.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        search.enablesReturnKeyAutomatically = false
        
        //検索結果配列にデータをコピーする。
        searchedTaskArray = taskArray
        
    }
    
    //テーブルビューの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セル数の指定
        taskArray = saveData.array(forKey: "big") as! [[String]]
        if taskArray.count > 0{
            
            print(taskArray.count)
            print("taskArrayの数は上記の通り")
            return  taskArray.count

        }else{
            
            print("taskArrayの数0")
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
    
    //サーチバーの設定
//    //検索ボタン押下時の呼び出しメソッド
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//
//        search.endEditing(true)
//        //検索結果配列を空にする。
//        searchedTaskArray.removeAll()
//
//        if(search.text == "") {
//            //検索文字列が空の場合はすべてを表示する。
//            searchedTaskArray = taskArray
//        } else {
//            //検索文字列を含むデータを検索結果配列に追加する。
//            for data in taskArray{
//                if data.containsString(search.text!) {
//                    searchedTaskArray.append(data)
//                }
//            }
//        }
//        //テーブルを再読み込みする。
//        table.reloadData()
//    }
    
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        taskArray.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        table.reloadData()
        
    }
    
    //並べ替え機能
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = taskArray[sourceIndexPath.row]
        taskArray.remove(at: sourceIndexPath.row)
        taskArray.insert(todo, at: destinationIndexPath.row)
    }
    
    //画面遷移をするときにTaskWriteViewControllerに編集用の情報を渡す

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if segue.identifier == "toTaskWrite"{
            
            //indexPathを持ってくる
            if let tableIndexPath = table.indexPathForSelectedRow{
                
                theIndex = tableIndexPath.row
              
            
            //画面遷移を変数に入れる
              let taskWriteViewController = segue.destination as! TaskWriteViewController
            
            //遷移先のindexにtheIndexを代入する(アンラップ)
                if let nonOptionalTheIndex = theIndex{
                taskWriteViewController.index = nonOptionalTheIndex
                }
            
            }
          }
      }
    
    @IBAction func plus(){
        
        performSegue(withIdentifier: "toTaskWrite", sender: nil)
        
    }
    


}


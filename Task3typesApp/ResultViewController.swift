//
//  ResultViewController.swift
//  Task3typesApp
//
//  Created by 八幡尚希 on 2021/02/15.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var search: UISearchBar!
    
    var genrenum: Int!
    
    var addContext: String!
    //タスクの配列
    var pastTaskArray = [String]()
    var nowTaskArray = [String]()
    var nearfTaskArray = [String]()
    var futureTaskArray = [String]()
    
    
    //savedataにアクセス
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
        pastTaskArray = ["会話したい" , "音楽を聴きたい", "サイコなことをしたい"]
        nowTaskArray = ["いいことしたい" , "貢献したい", "わー押したい"]
        nearfTaskArray = ["そーしたい" , "頭が痛い", "走行したい"]
        futureTaskArray = ["変形したい" , "電電したい", "変哲なことしたい"]
        
        if genrenum == 1 {
            genre.text = "＜過去＞タスク一覧"
            saveData.set(pastTaskArray, forKey: "udpastfTaskArray")
            pastTaskArray = saveData.array(forKey: "udpastTaskArray") as! [String]
            
        } else if genrenum == 2 {
            genre.text = "＜今＞タスク一覧"
            nowTaskArray = saveData.array(forKey: "udnowTaskArray") as! [String]
        } else if genrenum == 3 {
            genre.text = "＜近々＞タスク一覧"
            saveData.set(nearfTaskArray, forKey: "udnearfTaskArray")
            nearfTaskArray = saveData.array(forKey: "udnearfTaskArray") as! [String]
        } else if genrenum == 4 {
            genre.text = "＜未来＞タスク一覧"
            saveData.set(futureTaskArray, forKey: "udfutureTaskArray")
            futureTaskArray = saveData.array(forKey: "udfutureTaskArray") as! [String]
        }
        
        //save押して戻ってきた時
        if addContext != nil {
            if genrenum == 1 {
                pastTaskArray.append(addContext)
                saveData.set(pastTaskArray,forKey: "udpastTaskArray")
            } else if genrenum == 2 {
                nowTaskArray.append(addContext)
                saveData.set(nowTaskArray, forKey: "udnowTaskArray")
            } else if genrenum == 3 {
                nearfTaskArray.append(addContext)
                saveData.set(nearfTaskArray, forKey: "udnearfTaskArray")
            } else if genrenum == 4 {
                futureTaskArray.append(addContext)
                saveData.set(futureTaskArray, forKey: "udfutureTaskArray")
            }
        }
        //テスト
        print(UserDefaults.standard.dictionaryRepresentation())

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if addContext != nil {
            let alert: UIAlertController = UIAlertController(title:"保存", message: "メモの保存が完了いたしました。", preferredStyle: .alert)
            alert.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: { action in
                                //押された際のアクション
                                self.navigationController?.popViewController(animated: true)
                            }
                        )
            )
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTypeView" {
            let typeViewController = segue.destination as! TypeViewController
            typeViewController.genrenum = self.genrenum
        }
    }
    
    //セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastTaskArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if genrenum == 1 {
            cell?.textLabel?.text = pastTaskArray[indexPath.row]
        } else if genrenum == 2 {
            cell?.textLabel?.text = nowTaskArray[indexPath.row]
        } else if genrenum == 3 {
            cell?.textLabel?.text = nearfTaskArray[indexPath.row]
        } else if genrenum == 4 {
            cell?.textLabel?.text = futureTaskArray[indexPath.row]
        }
        return cell!
    }
    
    
    @IBAction func back(){
            self.presentingViewController?.presentingViewController?
                .dismiss(animated: true, completion: nil)
            
    }
    
    
}



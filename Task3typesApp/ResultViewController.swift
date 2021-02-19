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
    
    var thisTask = [String]()

    //savedataにアクセス
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        pastTaskArray = ["会話したい" , "音楽を聴きたい", "サイコなことをしたい"]
        nowTaskArray = ["いいことしたい" , "貢献したい", "わー押したい"]
        nearfTaskArray = ["そーしたい" , "頭が痛い", "走行したい"]
        futureTaskArray = ["変形したい" , "電電したい", "変哲なことしたい"]
        
//        let thisTaskArray:[[Any]] = [pastTaskArray,nowTaskArray,nearfTaskArray,futureTaskArray]
        
        if genrenum == 1 {
            thisTask = pastTaskArray
        } else if genrenum == 2 {
            thisTask = nowTaskArray
        } else if genrenum == 3 {
            thisTask = nearfTaskArray
        } else if genrenum == 4 {
            thisTask = futureTaskArray
        }
        
        
        //saveDataに中身があった場合のみ、thisTaskの値はsaveDataからとります。
        if saveData.object(forKey: "\(thisTask)") != nil {
            thisTask = saveData.array(forKey: "\(thisTask)") as! [String]
            print("yes")
        }
        
        
//        print(thisTask)
        // １、save押して戻ってきた時、thisTaskに追加します。そしてそれをsaveDataします。thisTaskは画面遷移すると元に戻ってしまいます。そのため、次からはthisTaskの中身をsaveDataからとるよ。
        if addContext != nil {
            thisTask.append(addContext)
            saveData.set(thisTask, forKey:"\(thisTask)")
        }
        //テスト
        print(UserDefaults.standard.dictionaryRepresentation().filter { $0.key.hasPrefix("\(thisTask)") })

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
        return thisTask.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = thisTask[indexPath.row]
        return cell!
    }
    
    
    @IBAction func back(){
            self.presentingViewController?.presentingViewController?
                .dismiss(animated: true, completion: nil)
            
    }
    
    
}



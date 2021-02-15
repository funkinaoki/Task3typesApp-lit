//
//  ResultViewController.swift
//  Task3typesApp
//
//  Created by 八幡尚希 on 2021/02/15.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var pastTaskArray = [String]()
    var nowTaskArray = [String]()
    var nearfTaskArray = [String]()
    var futureTaskArray = [String]()
    
    var testNumber: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        pastTaskArray = ["会話したい" , "音楽を聴きたい", "サイコなことをしたい"]
        nowTaskArray = ["いいことしたい" , "貢献したい", "わー押したい"]
        nearfTaskArray = ["そーしたい" , "頭が痛い", "走行したい"]
        futureTaskArray = ["変形したい" , "電電したい", "変哲なことしたい"]
        
        testNumber = Int.random(in: 1..<5)
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTypeView" {
            let typeViewController = segue.destination as! TypeViewController
            typeViewController.testNumber = self.testNumber
        }
    }
    
    //セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastTaskArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if testNumber == 1 {
        //セル内容表示のコード
        cell?.textLabel?.text = pastTaskArray[indexPath.row]
            
        } else if testNumber == 2 {
            cell?.textLabel?.text = nowTaskArray[indexPath.row]
        } else if testNumber == 3 {
            cell?.textLabel?.text = nearfTaskArray[indexPath.row]
        } else if testNumber == 4 {
            cell?.textLabel?.text = futureTaskArray[indexPath.row]
        }
        return cell!
    }
}

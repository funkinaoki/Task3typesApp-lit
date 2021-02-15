//
//  TypeViewController.swift
//  Task3typesApp
//
//  Created by 八幡尚希 on 2021/02/15.
//

import UIKit

class TypeViewController: UIViewController {
    
    var genrenum: Int = 0
    
    var addContext: String!
    
    @IBOutlet var addTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func toSaveTheData() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.addContext = self.addContext
            resultViewController.genrenum = self.genrenum
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        addContext = addTask.text
        toSaveTheData()
        
    }
    



}

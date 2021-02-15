//
//  SelectionViewController.swift
//  Task3typesApp
//
//  Created by 八幡尚希 on 2021/02/15.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var testNumber: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func toResultPage() {
        
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.testNumber = self.testNumber
        }
    }
    
    @IBAction func past(){
        testNumber = 1
        toResultPage()
    }
    
    @IBAction func now(){
        testNumber = 2
        toResultPage()
    }
    
    @IBAction func nearf(){
        testNumber = 3
        toResultPage()
    }

    
    @IBAction func future(){
        testNumber = 4
        toResultPage()
    }


 
}

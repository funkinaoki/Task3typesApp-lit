//
//  SelectionViewController.swift
//  Task3typesApp
//
//  Created by 八幡尚希 on 2021/02/15.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var genrenum: Int!
    
    @IBOutlet var pastButton: UIButton!
    @IBOutlet var nowButton: UIButton!
    @IBOutlet var nearfButton: UIButton!
    @IBOutlet var futureButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func toResultPage() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.genrenum = self.genrenum
        }
    }
    
    @IBAction func select(sender: UIButton){
        genrenum = sender.tag
        toResultPage()
    }


 
}

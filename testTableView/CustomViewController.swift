//
//  CustomViewController.swift
//  testTableView
//
//  Created by Romain Cardona on 05/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var liste: UITableView!
    
    var affliste: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        liste.nom = affliste
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

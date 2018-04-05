//
//  CustomTableViewController.swift
//  testTableView
//
//  Created by Romain Cardona on 05/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    // Création d'une constante data = à la classe Data
    let data = Data()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.donnes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellu", for: indexPath) as! CustomTableViewCell
        let entre1 = data.donnes[indexPath.row]
        let entre2 = data.donnes[indexPath.row]
        
        
        cell.gens.text = entre1.nom
        cell.gens2.text = entre2.prenom
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lien" {
            let details = segue.destination as! CustomViewController
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                let entre3 = data.donnes[indexPath.row]
                details.liste = entre3.nom
            }
            
            
        }
    }
}

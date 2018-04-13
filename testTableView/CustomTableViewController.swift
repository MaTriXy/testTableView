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
    
    // Variable prenant la structure filmslist
    var liste = [filmslist]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            print("All right BABY !")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // JSON
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://projetpersocardona.fr/transfert_script.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.liste = try JSONDecoder().decode([filmslist].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
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
        
        
        cell.gens.text = entre1.nom
        cell.gens2.text = entre1.prenom
        return cell
    }
            
            
        }

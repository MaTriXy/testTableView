//
//  CustomTableViewController.swift
//  testTableView
//
//  Created by Romain Cardona on 05/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    //le repository est l'objet qui va te fournir tes films
    //ici tu spécifie que tu veux utiliser le repository qui va tapper le json en ligne
    //tu mettrai = FilmRepositoryLocal() et sanq changer l'implémentation de ce controller,
    //tu recevrai des données en dur et non de ton webservice, je t'ai mit FilmRepositoryLocal comme exemple
    
    let filmsRepository = FilmsRepositoryJSON()
    //let filmsRepository = FilmsRepositoryLocal()
    
    //la liste des films que tu affichera dans ta liste
    var liste = [Film]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tu lance le téléchargement des films (ou la récupération en local)
        filmsRepository.getFilms { (films) in
            //tu vas recevoir dans (films) la liste des films téléchargés
            
            //tu les ajoute dans ta variable `liste`
            self.liste.append(contentsOf: films)
            print("All right BABY !")
            
            //et tu demande à la tableview de se mettre à jour
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellu", for: indexPath) as! CustomTableViewCell
        let film = liste[indexPath.row]
        
        //ici tu voudra afficher des films je pense
        //donc ça ressemblera plus à
        //cell.titreFilm.text = film.titre
        
        cell.gens.text = film.titre
        
        //et non
        //cell.gens.text = entre1.nom
        //cell.gens2.text = entre1.prenom
        return cell
    }
            
}

//
//  Data.swift
//  testTableView
//
//  Created by Romain Cardona on 05/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import Foundation

// Création d'un objet Data
class Data {
    // Création d'un deuxième objet Entree, cette classe servira à rentré les données
    class Entree {
        let nom: String
        let prenom: String
        // Initialisation des constantes
        init(nom: String, prenom: String) {
            self.nom = nom
            self.prenom = prenom
        }
        
    }
    // Création d'un tableau
    let donnes = [
        Entree(nom: "Dupond", prenom: "Romain"),
        Entree(nom: "Gomez", prenom: "Ricardo"),
        Entree(nom: "Cooper", prenom: "Sheldon"),
        Entree(nom: "Roumanet", prenom: "David"),
        Entree(nom: "Robert", prenom: "Lisa"),
        Entree(nom: "Lottin", prenom: "Camille"),
        Entree(nom: "Croset", prenom: "Alexis"),
        ]
    
    
}

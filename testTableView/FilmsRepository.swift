//
//  UserRepository.swift
//  testTableView
//
//  Created by florent champigny on 13/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import Foundation

protocol FilmsRepository {
    func getFilms(completed: @escaping ([Film]) -> ())
}

class FilmsRepositoryJSON : FilmsRepository {
    func getFilms(completed: @escaping ([Film]) -> ()) {
        
        let url = URL(string: "https://projetpersocardona.fr/transfert_script.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                var liste = [Film]()
                do {
                    //ton json ressemble à ça
                    
                    //[
                    //    {
                    //        "titre": "L'arme Fatale",
                    //        "genre": "Action",
                    //        "duree": "120"
                    //    }
                    //]
                    
                    //pour tester ce que tu reçois
                    var stringJson = String(data: data!, encoding: String.Encoding.utf8)
                    print(stringJson)
                    
                    //tu récupère le tableau
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [Any]
                    if(json != nil){
                        //puis pour chaque element du tableau
                        for case let jsonmovie as [String: Any] in json! {
                            
                            //récupère tes champs, titre duree genre
                            let titre = jsonmovie["titre"] as? String
                            let genre = jsonmovie["genre"] as? String
                            let duree = jsonmovie["duree"] as? String
                            
                            //dans notre objet Film on a besoin d'un Int
                            let dureeInt = Int(duree!)
                            
                            //et ici tu construit ton film
                            let film = Film(titre: titre!, genre: genre!, duree: dureeInt!)
                            
                            //puis l'ajoute a ta liste
                            liste.append(film)
                        }
                        
                    }
                } catch {
                    print("JSON Error")
                }
                
                //et ici tu renvoie la valeur à ton controller
                DispatchQueue.main.async {
                    completed(liste)
                }
            }
        }.resume()
    }
}

class FilmsRepositoryLocal : FilmsRepository {
    func getFilms(completed: @escaping ([Film]) -> ()) {
        //construit une liste en dur
        let liste = [
            Film(titre: "Terminator", genre: "Action", duree: 215),
            Film(titre: "50 nuances de grey", genre: "Romance", duree: 165),
            Film(titre: "50 nuances plus sombres", genre: "Romance", duree: 175)
        ]
        
        //et ici tu renvoie la valeur à ton controller
        DispatchQueue.main.async {
            completed(liste)
        }
    }
}


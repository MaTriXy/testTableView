//
//  films.swift
//  testTableView
//
//  Created by Romain Cardona on 10/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import Foundation

//en fait ta structure c'est un film, et non filmlist
//+ pense à mettre le nom de la struct avec une majuscule
struct Film: Decodable {
    let titre: String
    let genre: String
    let duree: Int
    
    init(titre: String, genre: String, duree: Int) {
        self.titre = titre
        self.genre = genre
        self.duree = duree
    }
    
}

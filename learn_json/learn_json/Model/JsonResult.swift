//
//  JsonResult.swift
//  learn_json
//
//  Created by matthieu passerel on 13/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import Foundation

// convertir le fichier JSON en objet
// Decodable est le protocole qui nous permet de décoder du JSON

/// créé cette struct pour le fichier two.json. Car si on passe directement dans results,  les données sont dans un tableau
struct JsonResult: Decodable {
    var results: [User]
}

/// Pour chaque élément, on donne le nom de la variable qui est exactement le mot clef et le type attribué soit exactement du même type :
struct User: Decodable {
    var gender: String
    var email: String
    var age: Int
    var nat: String
    var name: Name
    var location: Adress
    var picture: Picture
}

/// pour utiliser les dictionnaires JSON, il faut créer une nouvelle struct :
struct Name: Decodable {
    var title: String
    var first: String
    var last: String
}

struct Adress: Decodable {
    var street: String
    var city: String
    var state: String
    var postcode: Int
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}

struct Picture: Decodable {
    var large: String
    var medium: String
    var thumbnail: String
}


//
//  JsonFormatter.swift
//  learn_json
//
//  Created by matthieu passerel on 13/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import Foundation

class JSonFormatter {
    
    /// completion -> les data qu'on enverra au viewCOntroller
    func parse(fileName: String, ext: String, completion: (([User]) -> Void)?) {
        
        if let file = Bundle.main.url(forResource: fileName, withExtension: ext) {
            //Convertir en type Data
            /// comme Data est throw on écrit try / do / catch
            do {
                let jsonData = try Data(contentsOf: file)
                //Convertir data en User
                //1. Avec fichier one
                //let user = try JSONDecoder().decode(User.self, from: jsonData)
                //print(user.email)
                
                //2. Avec le fichier three
                //let users = try JSONDecoder().decode([User].self, from: jsonData)
                //print(users.count)
                
                //3. avec le fichier Two
                let results = try JSONDecoder().decode(JsonResult.self, from: jsonData)
//                print(results.results.count)
//                let users = results.results
//                for user in users {
//                    print(user.name.first)
//                }
                completion?(results.results)
            } catch {
                print(error.localizedDescription)
                completion?([])
            }
        } else {
            print("Ne peut pas récupérer Json depuis le fichier")
            completion?([])
        }
    }
    
}

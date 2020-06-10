//
//  ViewController.swift
//  learn_json
//
//  Created by matthieu passerel on 13/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileIV: CircleIV!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    
    var users: [User] = []
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        /// ici ce n'est pas minimumInteritemSpacing car on est à l'horyzontal
        layout.minimumLineSpacing = 30
        collectionView.collectionViewLayout = layout

        //Obtenir fichier Json
        JSonFormatter().parse(fileName: "two", ext: "json") { (users) in
            self.users = users
            self.collectionView.reloadData()
            self.user = self.users.first
            self.setupUser()
        }
    }
    
    func setupUser() {
        guard let selectedUser = user else { return }
        let name = selectedUser.name
        let nameStr = name.title + " " + name.first + " " + name.last
        nameLbl.text = nameStr
        emailLbl.text = "e-mail : " + selectedUser.email
        ageLbl.text = "Age : \(selectedUser.age)"
        
        let adress = selectedUser.location
        var adressStr = "Adresse : \n"
        adressStr += adress.street + "\n"
        adressStr += adress.city + "\n"
        adressStr += String(adress.postcode) + ", " + adress.state
        adressLbl.text = adressStr
        /// voir le fichier ImageExtension 
        profileIV.loadFrom(selectedUser.picture.large)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = users[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.urlString = user.picture.large
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.user = users[indexPath.item]
        setupUser()
    }
}


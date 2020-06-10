//
//  CollectionCell.swift
//  learn_json
//
//  Created by matthieu passerel on 13/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var myImageView: CircleIV!
    
    var urlString: String! {
        didSet {
            myImageView.loadFrom(urlString)
        }
    }
}

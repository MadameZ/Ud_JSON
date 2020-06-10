//
//  CircleIV.swift
//  learn_json
//
//  Created by matthieu passerel on 13/08/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import UIKit

class CircleIV: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = frame.width / 2
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 2
    }

}

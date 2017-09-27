//
//  DescriptionView Controller.swift
//  Discovery Park of America
//
//  Created by Paul Gosser on 9/8/17.
//  Copyright © 2017 Paul Gosser. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var infoText: UITextView!
    var item: Item!
    @IBOutlet var bgImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //print(item.name)
                
        nameLabel.text = item.name
        infoText.text = item.info
        bgImage.alpha = 0.6
    }

}

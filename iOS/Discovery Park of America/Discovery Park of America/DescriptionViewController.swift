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
    //@IBOutlet var bgImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //print(item.name)
                
        nameLabel.text = item.name
        infoText.text = item.info
        //item.image.alpha
        self.view.backgroundColor = UIColor(patternImage: item.image)
        
        //self.view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        
        //bgImage.alpha = 0.4
    }

}

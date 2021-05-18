//
//  ContentViewController.swift
//  Eateries
//
//  Created by Kotaev Ruslan on 13.05.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var header = ""
    var subheader = ""
    var imageFile = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = header
        subheaderLabel.text = subheader
        imageView.image = UIImage(named: imageFile)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

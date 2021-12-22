//
//  ViewController.swift
//  CharacterTraitsViewer
//
//  Created by MacOS on 22.12.2021.
//

import UIKit

class DisplayViewController: UIViewController {
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterChoiceButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func characterChoiceButtonTapped(_ sender: Any) {
    }
    
}


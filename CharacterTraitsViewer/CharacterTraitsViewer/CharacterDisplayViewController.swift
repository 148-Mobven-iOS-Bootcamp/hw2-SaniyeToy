//
//  ViewController.swift
//  CharacterTraitsViewer
//
//  Created by MacOS on 22.12.2021.
//

import UIKit
let rickNotificationKey = "RickSanchez"
let mortyNotificationKey = "MortySmith"
let bethNotificationKey = "BethSmith"

class CharacterDisplayViewController: UIViewController {
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterChoiceButton: UIButton!
    
    let rick = Notification.Name(rawValue: rickNotificationKey)
    let morty = Notification.Name(rawValue: mortyNotificationKey)
    let beth = Notification.Name(rawValue: bethNotificationKey)
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    func createObservers(){
        //Rick Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: rick, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: rick, object: nil)
        //Morty Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: morty, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: morty, object: nil)
        //Beth Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: beth, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: beth, object: nil)
    }
    
    
    @objc func updateNameLabel(notification: NSNotification){
        if notification.name == rick {
            let name = "Rick Sanchez"
            characterNameLabel.text = name
        }else if notification.name == morty {
            let name = "Morty Smith"
            characterNameLabel.text = name
        }else if notification.name == beth {
            let name = "Beth Smith"
            characterNameLabel.text = name
        } else{
        }
    }
    
    @objc func updateBackGround(notification: NSNotification){
        if notification.name == rick {
            view.backgroundColor = .systemBlue
        }else if notification.name == morty {
            view.backgroundColor = .systemGreen
        }else if notification.name == beth {
            view.backgroundColor = .systemRed
        }
    }
    
    
    @IBAction func characterChoiceButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "CharacterSelectionViewController") as! CharacterSelectionViewController
        selectionVC.selectionDelegate = self
        selectionVC.completionHandler = { gender in
            self.characterGenderLabel.text = gender
        }
        present(selectionVC, animated: true, completion: nil)
    }
    }
    

extension CharacterDisplayViewController: CharacterSelectionDelegate {
    func didTapChoice(image: UIImage) {
        characterImageView.image = image
    }

}

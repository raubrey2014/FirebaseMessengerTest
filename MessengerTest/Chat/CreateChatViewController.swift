//
//  CreateChatViewController.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 5/5/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit

class CreateChatViewController: UIViewController {

    @IBOutlet weak var createGroupButton: UIButton!
    
    @IBOutlet weak var groupNameTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        // Do any additional setup after loading the view.
    }
    
    func configureButton() {
        self.createGroupButton.layer.cornerRadius = 8
        self.createGroupButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelCreation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createGroup(_ sender: Any) {
        if groupNameTextBox.text != nil {
            let ref = Constants.refs.databaseChatsKeys.childByAutoId()
            
            let chatName = ["chat_name": groupNameTextBox.text]
            
            ref.setValue(chatName)
            
            self.dismiss(animated: true, completion: nil)
        } else {
            self.showGenericAlert(withTitle: "Failure", withMessage: "Group name is required!") { }
        }
    }
    
}

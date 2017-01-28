//
//  LoginVC.swift
//  DevChat
//
//  Created by Gary O Brien on 12/12/2016.
//  Copyright © 2016 Gary O Brien. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email =  emailField.text, let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 0) {
            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, Data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

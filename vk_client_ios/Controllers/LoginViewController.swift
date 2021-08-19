//
//  LoginViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/18/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginlabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if isValid() {
            print("Login")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
    }

    private func isValid() -> Bool {
        if loginTextField.text == "admin" && passwordTextField.text == "admin1" {
            return true
        } else {
            return false
        }
    }

}


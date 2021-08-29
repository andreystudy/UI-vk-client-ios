//
//  LoginViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/18/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var isValid: Bool {
        if loginTextField.text == "admin" && passwordTextField.text == "admin1" {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if isValid {
            print("Login")
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 0.8) {
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardShown"})?.priority = .required
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardHide"})?.priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets: UIEdgeInsets = .zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 0.8) {
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardShown"})?.priority = .defaultHigh
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardHide"})?.priority = .required
            self.view.layoutIfNeeded()
        }
    }

}


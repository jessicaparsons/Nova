//
//  WelcomeViewController.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    //MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addGradientBackground(colors: Constants.backgroundGradient)

    }
    
    //MARK: - IBACTIONS
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" {
            //reset password
        } else {
            showToast(message: "Enter your email address to reset your password.")
        }
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            //login
        } else {
            showToast(message: "All fields are required")
        }
    }
    
    
    //MARK: - SETUP
    
    

}





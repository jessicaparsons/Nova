//
//  RegisterViewController.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var datingOrFriendsSegmentedOutlet: UISegmentedControl!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressViewIndicator: UIActivityIndicatorView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    //MARK: - PROPERTIES
    
    var isDating: Bool = true
    private var viewModel = RegisterViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupBindings()
        progressView.isHidden = true
        view.addGradientBackground(colors: Constants.backgroundGradient)
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        signUpButton.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    

    //MARK: - IBACTIONS
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func datingOrFriendsPreferenceValueChanged(_ sender: UISegmentedControl) {

        isDating = sender.selectedSegmentIndex == 0 ? true : false
        print(isDating)
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {

        viewModel.registerUser(userName: nameTextField.text ?? "", email: emailTextField.text ?? "", location: locationTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "", isDating: isDating)
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - VIEW MODEL BINDING
        private func setupBindings() {
            viewModel.$errorMessage
                .compactMap { $0 }
                .sink { [weak self] message in
                    self?.showToast(message: message)
                }
                .store(in: &cancellables)

            viewModel.$isRegistrationSuccessful
                .filter { $0 }
                .sink { [weak self] _ in
                    self?.showToast(message: "Registration successful! Verification email sent.", backgroundColor: .green)
                }
                .store(in: &cancellables)
            
            viewModel.$showLoadingIndicator
                .sink { [weak self] isLoading in
                    if isLoading {
                        self?.progressView.isHidden = false
                        self?.progressViewIndicator.startAnimating()
                    } else {
                        self?.progressView.isHidden = true
                        self?.progressViewIndicator.stopAnimating()
                    }
                }
                .store(in: &cancellables)
        }
    
}

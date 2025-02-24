//
//  RegisterViewModel.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import Combine
import Foundation

class RegisterViewModel {
    
    
    @Published var errorMessage: String?
    @Published var isRegistrationSuccessful: Bool = false
    @Published var showLoadingIndicator: Bool = false
    
    func registerUser(userName: String, email: String, location: String, password: String, confirmPassword: String, isDating: Bool) {
        
        showLoadingIndicator = true
        
        guard userName != "", email != "", location != "", password != "", password != "" else {
            errorMessage = "All fields are required."
            showLoadingIndicator = false
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            showLoadingIndicator = false
            return
        }
        
        
        FirebaseUser.registerUserWith(email: email, password: password, userName: userName, city: location, isDating: isDating, dateOfBirth: Date()) { [weak self] error in
            
            self?.showLoadingIndicator = false
            
            if let error = error {
                self?.errorMessage = "Registration failed: \(error.localizedDescription)"
            } else {
                self?.isRegistrationSuccessful = true
            }
        }
    }
        
    
}

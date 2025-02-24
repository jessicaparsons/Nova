//
//  FirebaseUser.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import Foundation
import Firebase
import FirebaseAuth

class FirebaseUser: Equatable {
    
    static func == (lhs: FirebaseUser, rhs: FirebaseUser) -> Bool {
        lhs.objectID == rhs.objectID
    }
    
    let objectID: String = ""
    
    
    class func registerUserWith(email: String, password: String, userName: String, city: String, isDating: Bool, dateOfBirth: Date, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            
            completion(error)
            
            if error == nil {
                
                if let authData = authDataResult {
                    
                    authData.user.sendEmailVerification { error in
                        
                        print("auth verification email sent", error?.localizedDescription as Any)
                        
                    }
                } else {
                    print("Could not authorize user")
                }
                
                //create user in database
            }
        }
    }
    
}

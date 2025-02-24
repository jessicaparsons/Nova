//
//  UIViewControllerExtensions.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import UIKit

extension UIViewController {
    
    //DISMISS KEYBOARD
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //ERROR MESSAGES
    
    func showToast(message: String, duration: Double = 2.0, backgroundColor: UIColor = .red, textColor: UIColor = .white) {
            let toastLabel = UILabel(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 50))
            toastLabel.backgroundColor = backgroundColor.withAlphaComponent(0.8)
            toastLabel.textColor = textColor
            toastLabel.textAlignment = .center
            toastLabel.numberOfLines = 2
            toastLabel.text = message
            toastLabel.alpha = 0
            toastLabel.layer.cornerRadius = Constants.cornerRadius
            toastLabel.clipsToBounds = true
            view.addSubview(toastLabel)
            
            UIView.animate(withDuration: 0.5, animations: {
                toastLabel.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
                    toastLabel.alpha = 0
                }) { _ in
                    toastLabel.removeFromSuperview()
                }
            }
        }
}

//
//  UIViewExtensions.swift
//  Nova
//
//  Created by Jessica Parsons on 2/22/25.
//

import UIKit

extension UIView {
    
    func addGradientBackground(colors: [UIColor]) {
        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        gradientLayer.name = "GradientLayer"
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

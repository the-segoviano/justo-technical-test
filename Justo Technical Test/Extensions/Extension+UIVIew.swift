//
//  Extension+UIVIew.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBorder(color: UIColor = .red, width: CGFloat = 1.0) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints( NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary) )
    }
    
}

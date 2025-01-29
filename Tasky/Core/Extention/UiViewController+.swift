//
//  UiViewController+.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import Foundation
import UIKit


extension UIViewController{
    func addGradientBackgrund()  {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor(named: Colors.lilac)?.cgColor ?? UIColor.purple.cgColor
        ]
        view.layer.insertSublayer(gradient, at: 0)
    }
}

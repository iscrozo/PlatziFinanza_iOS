//
//  Shadow.swift
//  PlatziFinanzas
//
//  Created by Camilo Rozo on 2/07/21.
//

import UIKit

extension UIView {
    var borderUIColor : UIColor{
        get{
            guard let color = layer.borderColor else {
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
}

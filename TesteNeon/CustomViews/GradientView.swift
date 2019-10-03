//
//  GradientView.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 30/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.01, y: 0.01)
        layer.endPoint = CGPoint(x: 0.99, y: 0.99)
    }
    
}

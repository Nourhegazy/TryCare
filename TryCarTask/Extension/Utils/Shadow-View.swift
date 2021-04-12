//
//  Shadow-View.swift
//  Iraq
//
//  Created by UPS Apple on 4/26/20.
//  Copyright © 2020 UPSKWT. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.0
    @IBInspectable var borderWidth: Float = 0.0
    @IBInspectable var borderColor: UIColor? = UIColor.clear
    
    override func awakeFromNib() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = CGFloat(borderWidth)
    }
    
    func isNotValid (){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func selected () {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
}

@IBDesignable
class ShadowViewCircl: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var isCircle: Bool = true
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.0
    @IBInspectable var borderWidth: Float = 0.0
    @IBInspectable var borderColor: UIColor? = UIColor.clear
    
    override func layoutSubviews() {
        if isCircle == true {
            layer.cornerRadius = self.bounds.width / 2
            
        } else {
            layer.cornerRadius = cornerRadius
        }
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = CGFloat(borderWidth)
    }
    
}

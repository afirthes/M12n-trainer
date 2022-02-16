//
//  RoundButton.swift
//  M12n trainer
//
//  Created by Георгий Сабанов on 11.11.2021.
//

import Foundation
import UIKit

@IBDesignable
class AnswerRoundButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius == -1 {
                layer.cornerRadius = bounds.width / 2
            } else {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    private let backgroundLayer = CAShapeLayer()
    
    override var backgroundColor: UIColor? {
        set {
            setBackgroundColor(newValue)
        }
        get {
            guard let backgroundColor = backgroundLayer.backgroundColor else { return nil }
            return UIColor(cgColor: backgroundColor)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.borderColor = tintColor.cgColor
        layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        layer.borderColor = tintColor.cgColor
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        clipsToBounds = true
        layer.borderColor = tintColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if cornerRadius == -1 {
            layer.cornerRadius = bounds.width / 2
        }
        backgroundLayer.frame = layer.bounds
        backgroundLayer.cornerRadius = layer.cornerRadius
    }
    
    func setBackgroundColor(_ color: UIColor?, animated: Bool = true) {
        let color = color ?? .clear
        guard animated, color != .clear else {
            backgroundLayer.backgroundColor = color.cgColor
            return
        }
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.05
        animation.toValue = 1
        animation.duration = 0.3
        
        backgroundLayer.backgroundColor = color.cgColor
        backgroundLayer.add(animation, forKey: "scale")
        
    }
    
}

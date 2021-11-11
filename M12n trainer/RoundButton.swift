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
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.borderColor = tintColor.cgColor
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
    
}

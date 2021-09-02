//
//  AvatarView.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 9/2/21.
//

import UIKit

class AvatarImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.height / 2
    }
}

class AvatarShadowImage: UIView {
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: -1)
    @IBInspectable var shadowOpacity: Float = 0.1
    @IBInspectable var shadowRadius: CGFloat = 3
    
    override func awakeFromNib() {
        backgroundColor = .clear
        layer.cornerRadius = frame.height / 2
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}

class AvatarView: UIView {
    
    @IBOutlet weak var imageView: AvatarImageView!
    @IBOutlet weak var shadowView: AvatarShadowImage!
    
    @IBInspectable var shadowRadius: CGFloat = 25.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 6.0 {
        didSet {
            setNeedsDisplay()
        }
    }


    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 5) {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imageView.frame = rect
        imageView.layer.cornerRadius =  imageView.frame.height / 2
        imageView.clipsToBounds = true

        shadowView.frame = rect
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowOffset = shadowOffset
        shadowView.layer.shadowRadius = shadowBlur
        shadowView.layer.shadowPath = UIBezierPath(
            roundedRect: shadowView.bounds,
            cornerRadius: shadowRadius).cgPath
        
        shadowView.addSubview(imageView)
        self.addSubview(shadowView)
    }
}

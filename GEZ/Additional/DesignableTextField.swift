//
//  DesignableTextField.swift
//  GEZ
//
//  Created by Ayselkas on 3/29/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let image=leftImage{
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 5, y:0, width: 20, height: 20))
            
            imageView.image = image
            
            let view = UIImageView(frame: CGRect(x:0, y:0, width:25, height:20))
            
            view.addSubview(imageView)
            
            leftView=view
        }else if let image=rightImage{
            leftViewMode = .never
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            let view = UIImageView(frame: CGRect(x:0, y:0, width:25, height:20))
            view.addSubview(imageView)
            
            rightView=view
            
        }
    }
    
}


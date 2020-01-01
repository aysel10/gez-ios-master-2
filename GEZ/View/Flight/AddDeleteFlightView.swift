//
//  AddDeleteFlightView.swift
//  GEZ
//
//  Created by Ayselkas on 5/1/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class AddDeleteFlightView: UIView {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var buttonView: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        buttonView = loadFileFromNib()
        buttonView.frame = bounds
        buttonView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(buttonView)
    }
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AddDeleteFlightView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}

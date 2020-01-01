//
//  CruiseView.swift
//  GEZ
//
//  Created by Ayselkas on 4/7/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import BEMCheckBox
class CruiseView: UIView {

    @IBOutlet var cruiseView: UIView!
    @IBOutlet weak var flightCheckBox: BEMCheckBox!
    @IBOutlet weak var carCheckBox: BEMCheckBox!
    @IBOutlet weak var transferCheckBox: BEMCheckBox!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
          viewStyle()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
      
        cruiseView = loadFileFromNib()
        cruiseView.frame = bounds
        cruiseView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(cruiseView)
    }
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CruiseView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    func viewStyle(){
        print("asdas")
        Helper.squareCheckBox(flightCheckBox)
        Helper.squareCheckBox(carCheckBox)
        Helper.squareCheckBox(transferCheckBox)
    }

}

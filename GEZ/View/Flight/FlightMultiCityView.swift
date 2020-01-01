//
//  FlightMultiCityView.swift
//  GEZ
//
//  Created by Ayselkas on 5/1/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class FlightMultiCityView: UIView {
    @IBOutlet weak var flightMultiCityView: UIView!
    
    @IBOutlet weak var flightNumber: UILabel!
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
        flightMultiCityView = loadFileFromNib()
        flightMultiCityView.frame = bounds
        flightMultiCityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(flightMultiCityView)
    }
    
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FlightMultiCityView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}

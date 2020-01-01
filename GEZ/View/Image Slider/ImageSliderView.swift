//
//  ImageSliderView.swift
//  GEZ
//
//  Created by Ayselkas on 5/4/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import moa
import Auk

class ImageSliderView: UIView {

    @IBOutlet var sliderView: UIView!
    @IBOutlet weak var sliderScrollView: UIScrollView!
    
    //MARK: XIB VIEW
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSliderImages()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        sliderView = loadFileFromNib()
        sliderView.frame = bounds
        sliderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(sliderView)
    }
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ImageSliderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    func addSliderImages(){
        sliderScrollView.auk.settings.contentMode = .scaleAspectFill
        sliderScrollView.auk.show(url: "http://www.caribpress.com/wp-content/uploads/2017/03/Travel-site.jpg")
        sliderScrollView.auk.show(url: "https://st-process-production.s3.amazonaws.com/e046bb6c-3dd0-4d92-be54-134802864556/fcf7bcb5-17a4-435f-88dd-3c2ae96a7585.jpg")
        sliderScrollView.auk.show(url: "https://tryupdates.com/wp-content/uploads/2017/07/travel-banner-1.jpg")
        // Scroll to the next page
        sliderScrollView.auk.scrollToNextPage()
        
        // Scroll to the previous page
        sliderScrollView.auk.scrollToPreviousPage()
        sliderScrollView.auk.startAutoScroll(delaySeconds: 3)
        
        
    }
    

}

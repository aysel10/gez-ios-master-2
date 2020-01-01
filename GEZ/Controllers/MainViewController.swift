//
//  MainViewController.swift
//  GEZ
//
//  Created by Ayselkas on 3/30/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import Alamofire
import XMLMapper
import ObjectMapper
//import BEMCheckBox

class MainViewController: UIViewController {
    @IBOutlet weak var viewScroll: UIView!
    let labelColor = UIColor(red:0.15, green:0.17, blue:0.19, alpha:1.0)
    let activeColor = UIColor(red:0.44, green:0.75, blue:0.27, alpha:1.0)
    let defaultColor = UIColor(red:0.13, green:0.14, blue:0.14, alpha:1.0)
    let plusColor = UIColor(red:0.33, green:0.75, blue:0.09, alpha:1.0)
    let flightMultiView : FlightMultiCityView = FlightMultiCityView()
    var counter : Int = 0
    @IBOutlet var mainView: UIView!
    let stepper = UIStepper()
    let plusButton = UIButton()
    let trainView : TrainView = TrainView()
    let transferView : TransferView = TransferView()
    let flightView : FlightView = FlightView()
    let hotelView : HotelView = HotelView()
    let carView: CarView = CarView()
    let cruiseView: CruiseView = CruiseView()
    let buttonView : AddDeleteFlightView = AddDeleteFlightView()
    let stackView : UIStackView = UIStackView()
    let buttonStackView : UIStackView = UIStackView()
    let flightMultiViewThird : FlightMultiCityView = FlightMultiCityView()
    let flightMultiViewForth : FlightMultiCityView = FlightMultiCityView()
    let flightMultiViewFifth : FlightMultiCityView = FlightMultiCityView()
    
    @IBOutlet weak var azGezButton: UIButton!
    let imageSliderView : ImageSliderView = ImageSliderView()
    
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var flightButton: UIButton!
    @IBOutlet weak var hotelButton: UIButton!
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var lowcostButton: UIButton!
    @IBOutlet weak var trainButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var insuranceButton: UIButton!
    @IBOutlet weak var visaButton: UIButton!
    @IBOutlet weak var cruiseButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var menuOutlet: UIBarButtonItem!
  
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageSlider()
        addDefaultView()
        menuOutlet.target = self.revealViewController()
        menuOutlet.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 240
       // oneWayRequest()
   
    }
    func oneWayRequest(){
//        let xmlnsxsi = "http://www.w3.org/2001/XMLSchema-instance"
//        let authenticationSoapHeader = AuthenticationSoapHeader()
//        let destinationLocation = DestinationLocation(locationCode: "IST", multiAirportCityInd: "true")
//        let originLocation = DestinationLocation(locationCode: "BAK", multiAirportCityInd: "true")
//        let originDestinationInformation = OriginDestinationInformation(destinationLocation: destinationLocation,originLocation: originLocation, departureDateTime: "2018-05-25T12:00:00")
//        let passengerTypeQuantity = PassengerTypeQuantity(code: "ADT")
//        let airTravelerAvail = AirTravelerAvail.init(passengerTypeQuantity: passengerTypeQuantity)
//        let travelInfoSummary = TravelerInfoSummary(airTravelerAvail: airTravelerAvail)
//        let otaAirLowFareSearchRQ = OTAAirLowFareSearchRQ(maxPrice: "0",originDestinationInformation: originDestinationInformation, travelerInfoSummary: travelInfoSummary)
//        let searchFlight = SearchFlight(oTAAirLowFareSearchRQ: otaAirLowFareSearchRQ)
//        let soapBody = SoapBody(searchFlight: searchFlight)
//        let soapHeader = SoapHeader(authenticationSoapHeader: authenticationSoapHeader)
//        let soapEnvelope = SoapEnvelope(soapHeader: soapHeader, soapBody: soapBody)
//        let rootClass = RootClass(soapEnvelope: soapEnvelope)
//
//        let j = Mapper().toJSON(rootClass)
//                let headers = [
//            "Content-Type" : "application/json"
//        ]
//
//
//        Alamofire.request("http://88.99.186.108/api/Converter", method: .post, parameters: j, encoding: JSONEncoding.default, headers: headers).responseString{
//            response in
//            if response.result.isSuccess{
//                print("AYSLE")
//                print(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))
//                print(response.description)
//                print(response)
//            }else if response.result.isFailure {
//                print(response.result.error)
//                print(response.result.description)
//            }
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func azGezButton(_ sender: Any) {
        makeDefaultButtonColors()
        azGezButton.backgroundColor = activeColor
        removeViews()
    }
    @IBAction func flightButton(_ sender: Any) {
        makeDefaultButtonColors()
        flightButton.backgroundColor = activeColor
        removeViews()
       // addView(flightView)
        viewScroll.addSubview(flightView)
        flightView.translatesAutoresizingMaskIntoConstraints = false
        flightView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        flightView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: 0).isActive = true
        flightView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 0).isActive = true
        imageSliderView.topAnchor.constraint(equalTo: flightView.backImage.bottomAnchor, constant: 16).isActive = true
        //For making MultiCity Constraints work correctly
        if flightMultiCity(){
            imageSliderView.topAnchor.constraint(equalTo: flightView.backImage.bottomAnchor, constant: 20).isActive = false
        }
    }
    @IBAction func transferButton(_ sender: Any) {
        makeDefaultButtonColors()
        transferButton.backgroundColor = activeColor
        removeViews()
        addView(transferView)
        //viewScroll.bottomAnchor.constraint(equalTo: transferView.bottomAnchor, constant: 20).isActive = true

    }
    @IBAction func trainButton(_ sender: Any) {
        makeDefaultButtonColors()
        trainButton.backgroundColor = activeColor
        removeViews()
        addView(trainView)
        //viewScroll.bottomAnchor.constraint(equalTo: trainView.bottomAnchor, constant: 20).isActive = true
    }
    @IBAction func cruiseButton(_ sender: Any) {
        makeDefaultButtonColors()
        cruiseButton.backgroundColor = activeColor
        removeViews()
        addView(cruiseView)
    }
    @IBAction func hotelButton(_ sender: Any) {
        makeDefaultButtonColors()
        hotelButton.backgroundColor = activeColor
        removeViews()
        addView(hotelView)
       // viewScroll.bottomAnchor.constraint(equalTo: hotelView.bottomAnchor, constant: 20).isActive = true

        hotelSearch()
    }
    
    @IBAction func carButton(_ sender: Any) {
        makeDefaultButtonColors()
        carButton.backgroundColor = activeColor
        removeViews()
        addView(carView)
    }
    
    func removeViews(){
        trainView.removeFromSuperview()
        transferView.removeFromSuperview()
        flightView.removeFromSuperview()
        hotelView.removeFromSuperview()
        cruiseView.removeFromSuperview()
        carView.removeFromSuperview()
        stackView.removeFromSuperview()
        buttonView.removeFromSuperview()
    }
    
    func addView(_ myView : UIView){
        viewScroll.addSubview(myView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        myView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: 0).isActive = true
        myView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 0).isActive = true
        imageSliderView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20).isActive = true

    }
    
    func makeDefaultButtonColors(){
        flightButton.backgroundColor = defaultColor
        trainButton.backgroundColor = defaultColor
        carButton.backgroundColor = defaultColor
        lowcostButton.backgroundColor = defaultColor
        hotelButton.backgroundColor = defaultColor
        cruiseButton.backgroundColor = defaultColor
        transferButton.backgroundColor = defaultColor
    }
    
  
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        super.viewWillAppear(animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        super.viewWillDisappear(animated)
//    }
//
    
   
    
    func hotelSearch(){
        hotelView.searchButton.addTarget(self, action: #selector(self.search(_:)), for: .touchUpInside)
    }
    @objc func search(_ sender: UIButton){
        performSegue(withIdentifier: "hotelView", sender: self)
    }
    
    func flightMultiCity()->Bool{
        flightView.multiCityRadioButton.addTarget(self, action: #selector(self.multiCitySelected(_:)), for: .touchUpInside)
        flightView.oneWayRadioButton.addTarget(self, action: #selector(self.oneWaySelected(_:)), for: .touchUpInside)
        flightView.roundtripRadioButton.addTarget(self, action: #selector(self.roundtripSelected(_:)), for: .touchUpInside)
        buttonView.addButton.addTarget(self, action: #selector(self.addMultiCityView(_:)), for: .touchUpInside)
        buttonView.deleteButton.addTarget(self, action: #selector(self.removeCityView(_:)), for: .touchUpInside)
        return true
    }
    
    @objc func multiCitySelected(_ sender: Any){
        
        viewScroll.addSubview(stackView)
        viewScroll.addSubview(buttonStackView)
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        buttonStackView.alignment = .fill
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 16
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
     
        stackView.autoresizingMask = .flexibleWidth
        stackView.autoresizingMask = .flexibleHeight
        stackView.addArrangedSubview(flightMultiView)
        buttonStackView.addArrangedSubview(buttonView)
        
        stackView.topAnchor.constraint(equalTo: flightView.bottomAnchor, constant: 16).isActive = true
        stackView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 8).isActive = true
        stackView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: -8).isActive = true
        
        buttonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 8).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: -8).isActive = true
        
        imageSliderView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16).isActive = true
        
    }

    // MARK: Multy City View
    @objc func addMultiCityView(_: UIButton){
       
        if counter < 3 {
        counter = counter + 1

        switch (counter) {
            case 1:
                flightMultiViewThird.flightNumber.text = "THIRD FLY ROUTE"
                stackView.addArrangedSubview(flightMultiViewThird)

            case 2:
                flightMultiViewForth.flightNumber.text = "FORTH FLY ROUTE"
                stackView.addArrangedSubview(flightMultiViewForth)

            case 3:
                flightMultiViewFifth.flightNumber.text = "FIFTH FLY ROUTE"
                stackView.addArrangedSubview(flightMultiViewFifth)

            default:
                    print("VSEE")
            
        }
        }
    }
    @objc func removeCityView(_: UIButton){
        let flightMultiViewNew : FlightMultiCityView = FlightMultiCityView()
        if counter > 0{
            print(counter)
            switch (counter) {
                case 1:
                    stackView.removeArrangedSubview(flightMultiViewThird)
                    flightMultiViewThird.removeFromSuperview()
                case 2:
                    stackView.removeArrangedSubview(flightMultiViewForth)
                    flightMultiViewForth.removeFromSuperview()
                case 3:
                    stackView.removeArrangedSubview(flightMultiViewFifth)
                    flightMultiViewFifth.removeFromSuperview()
                default:
                    flightMultiViewNew.flightNumber.text = "FIRST"
                
            }
            counter = counter - 1
        }
    }
    
    @objc func oneWaySelected(_: UIButton){
        stackView.removeFromSuperview()
        buttonView.removeFromSuperview()
    }
    @objc func roundtripSelected(_: UIButton){
        stackView.removeFromSuperview()
        buttonView.removeFromSuperview()
    }
    
    func addImageSlider(){
        viewScroll.addSubview(imageSliderView)
        viewScroll.bottomAnchor.constraint(equalTo: imageSliderView.bottomAnchor, constant: 20).isActive = true
        imageSliderView.translatesAutoresizingMaskIntoConstraints = false
        //imageSliderView.bottomAnchor.constraint(equalTo: viewScroll.bottomAnchor, constant: 20).isActive = true
        imageSliderView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: -8).isActive = true
        imageSliderView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 8).isActive = true
        imageSliderView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    func addDefaultView(){
        makeDefaultButtonColors()
        flightButton.backgroundColor = activeColor
        removeViews()
        viewScroll.addSubview(flightView)
        flightView.translatesAutoresizingMaskIntoConstraints = false
        flightView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        flightView.rightAnchor.constraint(equalTo: viewScroll.rightAnchor, constant: 0).isActive = true
        flightView.leftAnchor.constraint(equalTo: viewScroll.leftAnchor, constant: 0).isActive = true
        imageSliderView.topAnchor.constraint(equalTo: flightView.backImage.bottomAnchor, constant: 16).isActive = true
        //For making MultiCity Constraints work correctly
        if flightMultiCity(){
            imageSliderView.topAnchor.constraint(equalTo: flightView.backImage.bottomAnchor, constant: 20).isActive = false
        }
    }
}

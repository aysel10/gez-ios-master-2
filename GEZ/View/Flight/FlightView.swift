//
//  FlightView.swift
//  GEZ
//
//  Created by Ayselkas on 4/2/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import BEMCheckBox
import DLRadioButton

@IBDesignable class FlightView: UIView, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    let labelColor = UIColor(red:0.15, green:0.17, blue:0.19, alpha:1.0)
    let activeColor = UIColor(red:0.44, green:0.75, blue:0.27, alpha:1.0)
    var selectedTextField : Int = 0
    let firstLabel = UILabel()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let myPickerView = UIPickerView()
    var adult = [ "1", "2", "3" ,"4" ,"5" ]
    var children = [ "1", "2", "3" ,"4" ,"5", "6", "7", "8" ]
    let flightMultiView : FlightMultiCityView = FlightMultiCityView()
    let flightMultiViewPlus : FlightMultiCityView = FlightMultiCityView()
    let flight : FlightMultiCityView = FlightMultiCityView()

    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var searchButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchButton: UIButton!
   
    
    @IBAction func multiCitySelected(_ sender: Any) {
        searchButton.isHidden = true
        addFirstLabel()
        firstLabel.isHidden = false
     
    }
    @IBAction func oneWaySelected(_ sender: Any) {
        searchButton.isHidden = false
        firstLabel.isHidden = true
        //flightMultiView.isHidden = true
        
    }
    @IBAction func roundtripSelected(_ sender: Any) {
        searchButton.isHidden = false
        firstLabel.isHidden = true
       // flightMultiView.isHidden = true
    }
    
    @IBOutlet weak var checkStackView: UIStackView!
    @IBOutlet weak var roundtripRadioButton: DLRadioButton!
    @IBOutlet weak var oneWayRadioButton: DLRadioButton!
    @IBOutlet weak var multiCityRadioButton: DLRadioButton!
    @IBOutlet weak var childrenNumberPicker: DesignableTextField!
    @IBOutlet weak var adultNumberPicker: DesignableTextField!
    @IBOutlet weak var dropOffTime: DesignableTextField!
    @IBOutlet weak var dropOffDate: DesignableTextField!
    @IBOutlet weak var addTransfer: BEMCheckBox!
    @IBOutlet weak var addHotel: BEMCheckBox!
    @IBOutlet weak var addCar: BEMCheckBox!
    @IBOutlet var flightView: UIView!
    
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
        flightView = loadFileFromNib()
        flightView.frame = bounds
        flightView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(flightView)
    }
    
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FlightView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func viewStyle(){
        Helper.squareCheckBox(addTransfer)
        Helper.squareCheckBox(addHotel)
        Helper.squareCheckBox(addCar)
        dropOffDate.delegate = self
        dropOffTime.delegate = self
        adultNumberPicker.delegate = self
        childrenNumberPicker.delegate = self
        
       
    }
    
    // MARK: TEXTFIELD DELEGATE
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            createDatePicker(textField)
        }else if textField.tag == 2 {
            createTimePicker(textField)
        }else if textField.tag == 3 {
            pickUp(textField)
        }else if textField.tag == 4 {
            pickUp(textField)
        }
    }
    
    // MARK: DATE PICKER
    
    func createDatePicker(_ textField : UITextField){
        selectedTextField = textField.tag
        //format for picker
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.darkGray
        //bar button item
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        
        //assigning date picker to text  field
        textField.inputView = datePicker
        
    }
    
    // MARK: TIME PICKER
    
    func createTimePicker(_ textField : UITextField){
        selectedTextField = textField.tag
        //format for picker
        datePicker.datePickerMode = .time
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.darkGray
        //bar button item
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        
        //assigning date picker to text  field
        textField.inputView = datePicker
        
    }
    // MARK: PICKER VIEW
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count : Int = 0
        if selectedTextField == 3 {
            count = adult.count
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            count = children.count
            //childrenNumberTextField.resignFirstResponder()
        }
        return count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var count : String = ""
        if selectedTextField == 3 {
            count = adult[row]
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            count = children[row]
            //childrenNumberTextField.resignFirstResponder()
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //format for picker
        
        if selectedTextField == 3 {
            adultNumberPicker.text = adult[row]
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberPicker.text = children[row]
            //childrenNumberTextField.resignFirstResponder()
        }
    }
    
    func pickUp(_ textField : UITextField){
        selectedTextField = textField.tag;
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        myPickerView.selectRow(3, inComponent: 0, animated: false)
        textField.inputView = self.myPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.darkGray
        
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    // Done and Cancel Buttons
    
    @objc func donePressed() {
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        if selectedTextField == 1 {
            dropOffDate.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 2 {
            dropOffTime.text = timeFormatter.string(from: datePicker.date)
        }else if selectedTextField == 3 {
            adultNumberPicker.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberPicker.resignFirstResponder()
        }
        
        self.endEditing(true)
    }
    
    @objc func cancelClick() {
        if selectedTextField == 1 {
            dropOffDate.resignFirstResponder()
        }else if selectedTextField == 2 {
            dropOffTime.resignFirstResponder()
        }else if selectedTextField == 3 {
            adultNumberPicker.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberPicker.resignFirstResponder()
        }
    }
    
    func addFirstLabel(){
        
        firstLabel.text = "FIRST FLY ROUTE"
        firstLabel.textColor = activeColor
        firstLabel.textAlignment = .center
        firstLabel.backgroundColor = labelColor
        firstLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
 
        flightView.addSubview(firstLabel)
        
        firstLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstLabel.topAnchor.constraint(equalTo: checkStackView.bottomAnchor, constant: 12).isActive = true
        firstLabel.rightAnchor.constraint(equalTo: flightView.rightAnchor, constant: -8).isActive = true
        firstLabel.leftAnchor.constraint(equalTo: flightView.leftAnchor, constant: 8).isActive = true
        
       // addMultiCityView()
    }
   
}

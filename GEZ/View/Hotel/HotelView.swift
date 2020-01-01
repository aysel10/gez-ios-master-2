//
//  HotelView.swift
//  GEZ
//
//  Created by Ayselkas on 4/2/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import BEMCheckBox

@IBDesignable class HotelView: UIView, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let activeColor = UIColor(red:0.44, green:0.75, blue:0.27, alpha:1.0)
    
    var selectedTextField : Int = 0
    let datePicker = UIDatePicker()
    let myPickerView = UIPickerView()
    var numbers = [ "1", "2", "3" ,"4" ,"5" ]
    var pickerData = [ "1", "2", "3" ,"4" ,"5", "6", "7", "8" ]
    
    @IBOutlet weak var roomNumberTextField: DesignableTextField!
    @IBOutlet weak var childrenNumberTextField: DesignableTextField!
    @IBOutlet weak var adultNumberTextField: DesignableTextField!
    @IBOutlet weak var returnTextField: DesignableTextField!
    @IBOutlet weak var departTextField: DesignableTextField!
    @IBOutlet weak var addTransferCheckBox: BEMCheckBox!
    @IBOutlet weak var addHotelCheckBox: BEMCheckBox!
    @IBOutlet weak var addCarCheckBox: BEMCheckBox!
    @IBOutlet var hotelView: UIView!
    @IBOutlet weak var searchButton: UIButton!
   
    
    @IBAction func search(_ sender: Any) {
        
    }
    //MARK: XIB VIEW
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
        hotelView = loadFileFromNib()
        hotelView.frame = bounds
        hotelView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(hotelView)
    }
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HotelView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    //MARK: MANUAL STYLING
    
    func viewStyle(){
        Helper.squareCheckBox(addTransferCheckBox)
        Helper.squareCheckBox(addHotelCheckBox)
        Helper.squareCheckBox(addCarCheckBox)
        returnTextField.delegate = self
        departTextField.delegate = self
        adultNumberTextField.delegate = self
        childrenNumberTextField.delegate = self
        roomNumberTextField.delegate = self
    }
    // MARK: TEXTFIELD DELEGATE
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 || textField.tag == 2 {
            createDatePicker(textField)
        }else if textField.tag == 3 ||
                textField.tag == 4 ||
            textField.tag == 5 {
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

    // MARK: PICKER VIEW
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //format for picker
        if selectedTextField == 3 {
            print("333332423423423")
            adultNumberTextField.text = pickerData[row]
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            print("44290409344494944444444")
            childrenNumberTextField.text = pickerData[row]
            //childrenNumberTextField.resignFirstResponder()
        }else if selectedTextField == 5{
            roomNumberTextField.text = pickerData[row]
        }
    }
    
    func pickUp(_ textField : UITextField){
        selectedTextField = textField.tag;
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
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
        if selectedTextField == 1 {
            departTextField.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 2 {
            returnTextField.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 3 {
            adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberTextField.resignFirstResponder()
        }else if selectedTextField == 5 {
            roomNumberTextField.resignFirstResponder()
        }
        self.endEditing(true)
    }
    
    @objc func cancelClick() {
        if selectedTextField == 3 {
            adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberTextField.resignFirstResponder()
        }else if selectedTextField == 1 {
            departTextField.resignFirstResponder()
        }else if selectedTextField == 2 {
            returnTextField.resignFirstResponder()
        }
    }

}

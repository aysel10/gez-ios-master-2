//
//  TransferView.swift
//  GEZ
//
//  Created by Ayselkas on 4/7/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import BEMCheckBox

class TransferView: UIView, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var transferView: UIView!
    var selectedTextField : Int = 0
    let datePicker = UIDatePicker()
    let myPickerView = UIPickerView()
    var numbers = [ "1", "2", "3" ,"4" ,"5" ]
    var pickerData = [ "1", "2", "3" ,"4" ,"5", "6", "7", "8" ]
    var carData = ["sedan", "jeep", "crossover"]
    
    @IBOutlet weak var passangers: DesignableTextField!
    @IBOutlet weak var typeOfCar: DesignableTextField!
    @IBOutlet weak var arrivalTime: DesignableTextField!
    @IBOutlet weak var arrivalDate: DesignableTextField!
    
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
        transferView = loadFileFromNib()
        transferView.frame = bounds
        transferView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(transferView)
    }
    
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TransferView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    //MARK: MANUAL STYLING
    
    func viewStyle(){
        arrivalDate.delegate = self
        arrivalTime.delegate = self
        typeOfCar.delegate = self
        passangers.delegate = self
    }
    
    // MARK: TEXTFIELD DELEGATE
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            createDatePicker(textField)
        }else if textField.tag == 2{
            createTimePicker(textField)
        }else if textField.tag == 3{
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
            count = carData.count
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            count = numbers.count
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
            count = carData[row]
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            count = numbers[row]
            //childrenNumberTextField.resignFirstResponder()
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //format for picker
        
        if selectedTextField == 3 {
            typeOfCar.text = carData[row]
            // adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            passangers.text = numbers[row]
            //childrenNumberTextField.resignFirstResponder()
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
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        if selectedTextField == 1 {
            arrivalDate.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 2 {
            arrivalTime.text = timeFormatter.string(from: datePicker.date)
        }else if selectedTextField == 3 {
            typeOfCar.resignFirstResponder()
        }else if selectedTextField == 4 {
            passangers.resignFirstResponder()
        }
        
        self.endEditing(true)
    }
    
    @objc func cancelClick() {
        if selectedTextField == 3 {
            typeOfCar.resignFirstResponder()
        }else if selectedTextField == 4 {
            passangers.resignFirstResponder()
        }else if selectedTextField == 1 {
            arrivalDate.resignFirstResponder()
        }else if selectedTextField == 2 {
            arrivalTime.resignFirstResponder()
        }
    }
}

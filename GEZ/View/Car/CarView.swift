//
//  CarView.swift
//  GEZ
//
//  Created by Ayselkas on 4/6/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit
import BEMCheckBox

class CarView: UIView, UITextFieldDelegate{

    @IBOutlet var carView: UIView!
    
    var selectedTextField : Int = 0
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let myPickerView = UIPickerView()
    var numbers = [ "1", "2", "3" ,"4" ,"5" ]
    var pickerData = [ "1", "2", "3" ,"4" ,"5", "6", "7", "8" ]
    
    @IBOutlet weak var dropTime: DesignableTextField!
    @IBOutlet weak var dropDate: DesignableTextField!
    @IBOutlet weak var pickTime: DesignableTextField!
    @IBOutlet weak var pickDate: DesignableTextField!
    @IBOutlet weak var addTransferCheckBox: BEMCheckBox!
    @IBOutlet weak var addHotelCheckBox: BEMCheckBox!
    @IBOutlet weak var addCarCheckBox: BEMCheckBox!
    @IBOutlet weak var pickCheckBox: BEMCheckBox!
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
        carView = loadFileFromNib()
        carView.frame = bounds
        carView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(carView)
    }
    func loadFileFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CarView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
  
    //MARK: MANUAL STYLING
    
    func viewStyle(){
        Helper.squareCheckBox(addTransferCheckBox)
        Helper.squareCheckBox(addHotelCheckBox)
        Helper.squareCheckBox(addCarCheckBox)
        Helper.squareCheckBox(pickCheckBox)
        pickTime.delegate = self
        pickDate.delegate = self
        dropTime.delegate = self
        dropDate.delegate = self
    }
    // MARK: TEXTFIELD DELEGATE
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            createDatePicker(textField)
        }else if textField.tag == 2{
            createTimePicker(textField)
        }else if textField.tag == 3{
            createDatePicker(textField)
        }else if textField.tag == 4 {
            createTimePicker(textField)
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
            pickDate.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 2 {
            pickTime.text = timeFormatter.string(from: datePicker.date)
        }else if selectedTextField == 3 {
            dropDate.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 4 {
            dropTime.text = timeFormatter.string(from: datePicker.date)
            
        }
        
        self.endEditing(true)
    }
    
    @objc func cancelClick() {
        if selectedTextField == 3 {
            pickDate.resignFirstResponder()
        }else if selectedTextField == 4 {
            pickTime.resignFirstResponder()
        }else if selectedTextField == 1 {
            dropDate.resignFirstResponder()
        }else if selectedTextField == 2 {
            dropTime.resignFirstResponder()
        }
    }

}

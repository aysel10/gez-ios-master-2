//
//  TrainViewController.swift
//  GEZ
//
//  Created by Ayselkas on 3/29/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class TrainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var childrenNumberTextField: UITextField!
    @IBOutlet weak var adultNumberTextField: UITextField!
    @IBOutlet weak var returnDateTextField: UITextField!
    @IBOutlet weak var departDateTextField: UITextField!
    
    var numbers = [ "1", "2", "3" ,"4" ,"5" ]
    var pickerData = [ "1", "2", "3" ,"4" ,"5", "6", "7", "8" ]
    var selectedTextField : Int = 0
    
    let datePicker = UIDatePicker()
    let myPickerView = UIPickerView()
  //  let pickerView = UIPickerView()
    
    
    
    @IBOutlet weak var FlightButton: UIButton!
    @IBAction func FlightButton(_ sender: Any) {
        self.FlightButton.backgroundColor = UIColor(red:0.44, green:0.75, blue:0.27, alpha:1.0)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDatePicker(_ textField : UITextField){
        selectedTextField = textField.tag
        //format for picker
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor(red: 113/255, green: 191/255, blue: 68/255, alpha: 1)
        //bar button item
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    
        textField.inputAccessoryView = toolbar
        
        //assigning date picker to text  field
        textField.inputView = datePicker
        
    }

    @objc func donePressed() {
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        if selectedTextField == 1 {
            departDateTextField.text = dateFormatter.string(from: datePicker.date)
        }else if selectedTextField == 2 {
            returnDateTextField.text = dateFormatter.string(from: datePicker.date)
        }
        self.view.endEditing(true)
    }
//    @objc func donePressedForDepart() {
//
//        // format date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        dateFormatter.timeStyle = .none
//        if selectedTextField
//        departDatePicker.text = dateFormatter.string(from: datePicker.date)
//        self.view.endEditing(true)
//    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 3 || textField.tag == 4 {
            pickUp(textField)
        }else if textField.tag == 1 || textField.tag == 2 {
            createDatePicker(textField)
        }
    }
    
    func pickUp(_ textField : UITextField){
        selectedTextField = textField.tag;
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
       
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 113/255, green: 191/255, blue: 68/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    @objc func doneClick() {
        if selectedTextField == 3 {
            adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberTextField.resignFirstResponder()
        }
    }
    @objc func cancelClick() {
        if selectedTextField == 3 {
            adultNumberTextField.resignFirstResponder()
        }else if selectedTextField == 4 {
            childrenNumberTextField.resignFirstResponder()
        }else if selectedTextField == 1 {
            departDateTextField.resignFirstResponder()
        }else if selectedTextField == 2 {
            returnDateTextField.resignFirstResponder()
        }
    }


}

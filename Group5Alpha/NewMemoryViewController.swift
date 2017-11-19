//
//  NewMemoryViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/29/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit

class NewMemoryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var memoryTextField: UITextField!
    
    @IBOutlet weak var emotionTextField: UITextField!
    
    @IBOutlet weak var dropdownList: UIPickerView!
    
    let date : String = ""
    
    var emotion = ["Happy", "Excited", "Nervous", "Anxious", "Angry", "Frustrated", "Tired",  "Annoyed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        memoryTextField.delegate = self

        self.dropdownList.dataSource = self;
        self.dropdownList.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dismiss keyboard when hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Dismess keyboard by touching outside of it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return emotion.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return emotion[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.emotionTextField.text = self.emotion[row]
        // self.dropdownList.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.emotionTextField {
            self.dropdownList.isHidden = false
            // if you dont want the users to se the keyboard type:
            textField.endEditing(true)
        }
        
    }
    
    @IBAction func createMemory(_ sender: Any) {
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

 }

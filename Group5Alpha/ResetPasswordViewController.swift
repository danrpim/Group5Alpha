//
//  ResetPasswordViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/31/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailField.delegate = self
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
    
    @IBAction func submitAction(_ sender: AnyObject) {
        
        if emailField.text == "" {
            
            errorLabel.text = "Please enter an email."
            
        } else {
            
            Auth.auth().sendPasswordReset(withEmail: emailField.text!, completion: { (error) in
                
                if error != nil {
                    self.errorLabel.text = "Error: " + (error?.localizedDescription)!
                } else {
                    self.errorLabel.text = "Password reset email sent"
                }

            })
        }
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
